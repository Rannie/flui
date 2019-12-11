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
    ['link', { rel: 'icon', href: 'assets/img/flui_logo_trans.png' }]
  ],
  themeConfig: {
    logo: '/assets/img/flui_logo_withtext.png',
    repo: 'Rannie/flui',
    smoothScroll: true,
    locales: {
      '/': {
        selectText: '选择语言',
        label: '简体中文',
        nav: [
          { text: '指南', link: '/guide/' },
          { text: '组件', link: '/widgets/' }
        ],
        sidebar: {
          '/widgets/': [
            '',
            'button',
            'appbar',
            'toast',
            'label',
            'bubble',
            'input',
            'badge',
            'empty',
            'notice-bar',
            'skeleton',
            'bottom-sheet',
            'other',
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
          { text: 'Widgets', link: '/en/widgets/' }
        ],
        sidebar: {
          '/en/widgets/': [
            '',
            'button',
            'appbar',
            'toast',
            'label',
            'bubble',
            'input',
            'badge',
            'empty',
            'notice-bar',
            'skeleton',
            'bottom-sheet',
            'other',
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
