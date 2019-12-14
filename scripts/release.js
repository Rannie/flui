const path = require('path')
const execa = require('execa')
const inquirer = require('inquirer')
const yaml = require('node-yaml')
const ora = require('ora')
const chalk = require('chalk')
const yamlPath = path.resolve(__dirname, '../pubspec.yaml')

const validateVersion = input => {
  return /^(\d+\.\d+\.\d+(-(alpha|beta|rc.\d+))?)/.test(input)
}

const release = async () => {
  // static analyze
  let indicator = ora('flutter analyzing...')
  indicator.start()
  try {
    await execa('flutter', ['analyze'])
  } catch (e) {
    promptError(e)
  }

  indicator.succeed()

  // load version
  const res = JSON.parse(JSON.stringify(yaml.readSync(yamlPath)))
  const currentVersion = res.version

  // input release version & description
  const { newVersion } = await inquirer.prompt([
    {
      name: 'newVersion',
      message: `input new version (current is ${currentVersion})`,
      type: 'input',
      validate: validateVersion
    }
  ])

  // write to yaml file
  res.version = newVersion
  yaml.writeSync(yamlPath, res)

  // commit changes
  indicator = ora('git commit & push')
  indicator.start()
  try {
    await execa('git', ['add', '-A'])
    await execa('git', ['commit', '-m', 'chore: pre release sync'])
    await execa('git', ['push'])
  } catch(e) {
    promptError(e)
  }

  indicator.succeed()
  // tag & push
  indicator = ora('git tag & push tag')
  indicator.start()
  const newTag = `v${newVersion}`
  try {
    await execa('git', ['tag', newTag])
    await execa('git', ['push', 'origin', newTag])
  } catch (e) {
    promptError(e)
  }
  indicator.succeed()

  // TODO: publish to flutter pub
}

const promptError = (e) => {
  console.log()
  console.error(`\n\n${e.stdout}\n\n${chalk.red(e.stderr)}\n\n`)
  process.exit(1)
}

release().catch(err => {
  console.error(err)
  process.exit(1)
})
