// next: use Dart to do these script jobs.
const chalk = require('chalk')
const msgPath = process.env.HUSKY_GIT_PARAMS
if (!msgPath) {
  console.error(chalk.red(`process.env.HUSKY_GIT_PARAMS can't be ${msgPath}, please check`))
  process.exit(1)
}
console.log('GIT_PARAMS: ', msgPath)
const msg = require('fs').readFileSync(msgPath, 'utf8').trim()
const commitRE = /^(v\d+\.\d+\.\d+(-(alpha|beta|rc.\d+))?)|(revert: )?(feat|fix|docs|style|refactor|perf|test|workflow|ci|chore|types)(\(.+\))?!?: .{1,50}/

if (!commitRE.test(msg)) {
  console.log();
  console.error(
    `  ${chalk.bgRed.white(' ERROR ')} ${chalk.red(`invalid commit message format.`)}\n\n` +
    chalk.red(`  Proper commit message format is required for automated changelog generation. Examples:\n\n`) +
    `    ${chalk.green(`feat(compiler): add 'comments' option`)}\n` +
    `    ${chalk.green(`fix(v-model): handle events on blur (close #28)`)}\n\n`
  )
  process.exit(1)
}