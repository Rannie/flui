module.exports = {
  locales: {
    '/': {
      lang: 'zh-CN',
      title: 'FLUI',
      description: '一个 Google Flutter 的组件扩展集'
    },
    '/en/': {
      lang: 'en-US',
      title: 'FLUI',
      description: 'A widget kit of Google Flutter'
    }
  },
  head:[
    ['link', { rel: 'icon', href: 'assets/img/flui_logo.png' }]
  ],
  themeConfig: {
    logo: '/assets/img/logot_s.png',
    repo: 'Rannie/flui',
    smoothScroll: true,
    locales: {
      '/': {
        selectText: '选择语言',
        label: '简体中文',
        nav: [
          { text: '指南', link: '/guide/' },
          { text: '组件', link: '/widgets/' },
          { text: '示例', link: '/demo/' }
        ],
        sidebar: {
          '/widgets/': [
            '',
            'button',
            'label',
            'toast',
            'bubble',
            'input',
            'avatar',
            'badge',
            'image',
            'appbar',
            'notice-bar',
            'empty',
            'skeleton',
            'bottom-sheet',
            'list',
            'theme'
          ]
        },
        sidebarDepth: 2,
      },
      '/en/': {
        selectText: 'Languages',
        label: 'English',
        ariaLabel: 'Languages',
        nav: [
          { text: 'Guide', link: '/en/guide/' },
          { text: 'Widgets', link: '/en/widgets/' },
          { text: 'Demo', link: '/en/demo/' }
        ],
        sidebar: {
          '/en/widgets/': [
            '',
            'button',
            'label',
            'toast',
            'bubble',
            'input',
            'avatar',
            'badge',
            'image',
            'appbar',
            'notice-bar',
            'empty',
            'skeleton',
            'bottom-sheet',
            'list',
            'theme'
          ]
        },
        sidebarDepth: 2,
      }
    },
  },
  configWebpack: {
    resolve: {
      alias: {
        '@image': '/assets/img'
      }
    }
  }
};
