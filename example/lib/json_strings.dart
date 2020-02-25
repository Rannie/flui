
const FlexLayoutJson =
    '{"uniqueId":"flui-safearea","unitName":"SafeArea","child":{"uniqueId":"flui-view01","unitName":"Container","align":{"type":"Column"},"padding":{"top":20,"left":20,"right":20,"bottom":20},"children":[{"uniqueId":"flui-view01-c01","unitName":"Container","height":60,"align":{"type":"Row","mainAxisAlignment":"spaceBetween"},"children":[{"uniqueId":"flui-view01-c01-c01","unitName":"Container","color":"0xFF42A5F5","width":80},{"uniqueId":"flui-view01-c01-c02","unitName":"Container","color":"0xFF42A5F5","width":80},{"uniqueId":"flui-view01-c01-c03","unitName":"Container","color":"0xFF42A5F5","width":80}]},{"unitName":"SizedBox","height":20},{"uniqueId":"flui-view01-c02","unitName":"Container","height":60,"color":"0xFF4047B2"},{"unitName":"SizedBox","height":20},{"uniqueId":"flui-view01-c03","unitName":"Container","height":60,"color":"0xFFF4047B2"},{"unitName":"SizedBox","height":20},{"uniqueId":"flui-view01-c04","unitName":"Container","height":60,"color":"0xFF4047B2"},{"unitName":"SizedBox","height":20},{"uniqueId":"flui-view01-c05","unitName":"Container","height":60,"color":"0xFF4047B2"},{"unitName":"SizedBox","height":20},{"uniqueId":"flui-view01-c06","unitName":"Container","height":60,"color":"0xFFEE6E73","flex":"Expanded"}]}}';

const ContainerEffectJson =
    '{"uniqueId":"flui-view01","unitName":"Container","color":"0xFF4B5BC2","height":300,"padding":{"top":50,"left":50,"bottom":50,"right":50},"child":{"uniqueId":"flui-view01-c01","unitName":"Container","decoration":{"color":"0xFFB7B4C6","border":{"color":"0xFF949DB8"},"borderRadius":{"radius":5},"boxShadow":[{"color":"0xFF3D394F","offset":{"dx":2,"dy":2},"blurRadius":4}]}}}';

const ListJson =
    '{"uniqueId":"flui-safearea","unitName":"SafeArea","child":{"uniqueId":"flui-list01","unitName":"ListView","shrinkWrap":true,"separatedDivider":{"height":1},"children":[{"uniqueId":"tile-01","unitName":"ListTile","title":{"unitName":"Text","text":"FLUI"},"subtitle":{"unitName":"Text","text":"An UI framework for Flutter"}},{"uniqueId":"tile-02","unitName":"ListTile","title":{"unitName":"Text","text":"json_serializable"},"subtitle":{"unitName":"Text","text":"Converting to and from JSON"}},{"uniqueId":"tile-03","unitName":"ListTile","title":{"unitName":"Text","text":"http"},"subtitle":{"unitName":"Text","text":"API for HTTP requests."}},{"uniqueId":"tile-04","unitName":"ListTile","title":{"unitName":"Text","text":"intl"},"subtitle":{"unitName":"Text","text":"I18N"}},{"uniqueId":"tile-05","unitName":"ListTile","title":{"unitName":"Text","text":"meta"},"subtitle":{"unitName":"Text","text":"Provide additional semantic information"}},{"uniqueId":"tile-06","unitName":"ListTile","title":{"unitName":"Text","text":"rxdart"},"subtitle":{"unitName":"Text","text":"ReactiveX api for asynchronous programming"}},{"uniqueId":"tile-07","unitName":"ListTile","title":{"unitName":"Text","text":"path"},"subtitle":{"unitName":"Text","text":"A string-based path manipulation library"}},{"uniqueId":"tile-08","unitName":"ListTile","title":{"unitName":"Text","text":"collection"},"subtitle":{"unitName":"Text","text":"Collections and utilities functions and classes"}},{"uniqueId":"tile-09","unitName":"ListTile","title":{"unitName":"Text","text":"uuid"},"subtitle":{"unitName":"Text","text":"UUID Generator and Parser"}},{"uniqueId":"tile-10","unitName":"ListTile","title":{"unitName":"Text","text":"async"},"subtitle":{"unitName":"Text","text":"Utility functions and classes related to the \'dart:async\'"}},{"uniqueId":"tile-11","unitName":"ListTile","title":{"unitName":"Text","text":"equatable"},"subtitle":{"unitName":"Text","text":"An abstract class that helps to implement equality"}},{"uniqueId":"tile-12","unitName":"ListTile","title":{"unitName":"Text","text":"dio"},"subtitle":{"unitName":"Text","text":"A powerful Http client for Dart"}}]}}';

const StackJson =
    '{"uniqueId":"flui-safearea","unitName":"SafeArea","child":{"unitName":"Container","uniqueId":"flui-container01","height":180,"color":"@theme.cardColor","child":{"uniqueId":"flui-stack01","unitName":"Stack","children":[{"uniqueId":"header-pic","unitName":"Image","positioned":{"left":20,"top":40,"width":60,"height":60},"imageProvider":{"type":"asset","assetName":"assets/iron_man.png"},"fit":"scaleDown"},{"unitName":"Text","positioned":{"left":95,"top":15,"right":20,"height":20},"text":"Pinned Tweet","textStyle":{"color":"0xFF9EA3A9","fontSize":14}},{"uniqueId":"nick-name","unitName":"Text","positioned":{"left":95,"top":38,"right":20,"height":20},"text":"Flutter Team","textStyle":{"color":"@theme.accentColor","fontSize":17}},{"uniqueId":"content","unitName":"Text","text":"👏👏🚀🚀🍔Flutter is Google’s UI toolkit for building beautiful, natively compiled applications for mobile, web, and desktop from a single codebase.","positioned":{"left":95,"top":65,"right":20,"bottom":35},"maxLines":6,"textStyle":{"fontSize":15}},{"uniqueId":"comment-icon","unitName":"Icon","icon":{"codePoint":57547,"fontFamily":"MaterialIcons"},"size":18,"color":"0xFF9EA3A9","positioned":{"left":95,"bottom":9,"width":18,"height":18}},{"uniqueId":"comment-count","unitName":"Text","text":"194","positioned":{"left":117,"bottom":6,"height":20,"width":50},"textStyle":{"fontSize":13,"color":"0xFF9EA3A9"}},{"uniqueId":"transfer-icon","unitName":"Icon","icon":{"codePoint":57408,"fontFamily":"MaterialIcons","matchTextDirection":true},"size":18,"color":"0xFF9EA3A9","positioned":{"left":195,"bottom":9,"width":18,"height":18}},{"uniqueId":"transfer-count","unitName":"Text","text":"72","positioned":{"left":217,"bottom":6,"height":20,"width":50},"textStyle":{"fontSize":13,"color":"0xFF9EA3A9"}},{"uniqueId":"fav-icon","unitName":"Icon","icon":{"codePoint":59518,"fontFamily":"MaterialIcons"},"size":18,"color":"0xFF9EA3A9","positioned":{"left":295,"bottom":9,"width":18,"height":18}},{"uniqueId":"fav-count","unitName":"Text","text":"230","positioned":{"left":317,"bottom":6,"height":20,"width":50},"textStyle":{"fontSize":13,"color":"0xFF9EA3A9"}}]}}}';

const RichTextJson =
    '{"unitName":"Container","uniqueId":"flui-container-01","height":300,"padding":{"all":20},"child":{"uniqueId":"richtext","unitName":"RichText","text":{"uniqueId":"root-span","textStyle":{"themeStyle":"@textTheme.body2"},"children":[{"text":"🎉🎉🎉🎉🎉👉FLUI 1.0 has been released, welcome to use and make suggestions.\\n\\n","textStyle":{"fontSize":18}},{"text":"🏠 Home Page:  "},{"uniqueId":"span-link-home","text":"https://www.flui.xin/en\\n","textStyle":{"color":"0xFF2196F3","textDecorations":["underline"]}},{"text":"🖥 GitHub:  "},{"uniqueId":"span-link-github","text":"https://github.com/rannie/flui","textStyle":{"color":"0xFF2196F3","textDecorations":["underline"]}}]},"maxLines":10}}';
