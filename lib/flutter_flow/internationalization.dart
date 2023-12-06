import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'zh_Hans', 'zh_Hant'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? zh_HansText = '',
    String? zh_HantText = '',
  }) =>
      [enText, zh_HansText, zh_HantText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // home_page
  {
    'uxtixrh2': {
      'en': 'CHANEL',
      'zh_Hans': 'CHANEL',
      'zh_Hant': 'CHANEL',
    },
    '6bup0s4z': {
      'en': 'COCO NEIGE',
      'zh_Hans': 'COCO NEIGE',
      'zh_Hant': 'COCO NEIGE',
    },
    'i4cnv8la': {
      'en': 'IN BOUTIQUES',
      'zh_Hans': '现已于精品店登场',
      'zh_Hant': '現已於精品店登場',
    },
    'dmvsd5tr': {
      'en':
          'As technical as ever, the CHANEL COCO NEIGE 2023/24 collection imagined by\nVirginie Viard is embodied by actress and House ambassador Lily-Rose Depp, in a fashion series inspired by the universe of ice-skating.',
      'zh_Hans':
          'Virginie Viard设计的CHANEL 2023/24 COCO NEIGE系列贯彻技术功能本色，由品牌大使Lily-Rose Depp 演绎的一系列时装影像以溜冰运动为灵感。',
      'zh_Hant':
          'Virginie Viard設計的CHANEL 2023/24 COCO NEIGE系列貫徹技術功能本色，由品牌大使Lily-Rose Depp 演繹的一系列時裝影像以溜冰運動為靈感。',
    },
    'b4ut5306': {
      'en': 'Read more',
      'zh_Hans': '更多资讯',
      'zh_Hant': '更多資訊',
    },
    '1lg6o35y': {
      'en': 'DISCOVER MORE IN BOUTIQUES',
      'zh_Hans': '于精品店了解更多',
      'zh_Hant': '於精品店了解更多',
    },
    'yea8500b': {
      'en': 'Discover the featured creations of the collection',
      'zh_Hans': '浏览图中显示的设计系列',
      'zh_Hant': '瀏覽圖中顯示的設計系列',
    },
    'y3lwytys': {
      'en': 'SEE MORE',
      'zh_Hans': '查看更多',
      'zh_Hant': '查看更多',
    },
    'a64ywwb7': {
      'en': 'ALL THE LOOKS',
      'zh_Hans': '所有造型',
      'zh_Hant': '所有造型',
    },
    'f978lvz2': {
      'en': 'SEE MORE',
      'zh_Hans': '查看更多',
      'zh_Hant': '查看更多',
    },
    'xpum9flj': {
      'en': 'IN A SELECTION OF BOUTIQUES',
      'zh_Hans': '现已于精品店登场',
      'zh_Hant': '現已於精品店登場',
    },
    'f24jnbjf': {
      'en': 'AMERICA',
      'zh_Hans': '美国',
      'zh_Hant': '美國',
    },
    'iypl6346': {
      'en': 'ASIA-PACIFIC',
      'zh_Hans': '亚太',
      'zh_Hant': '亞太',
    },
    '6fql45vd': {
      'en': 'MIDDLE EAST',
      'zh_Hans': '中东',
      'zh_Hant': '中東',
    },
    'jekyt0zv': {
      'en': 'Discover more in boutiques',
      'zh_Hans': '于精品店观看更多',
      'zh_Hant': '於精品店觀看更多',
    },
    'is76bqu7': {
      'en':
          'Our creations are thoughtfully curated by each of our boutiques. To discover more, we invite you to find the boutique nearest you.',
      'zh_Hans': '每家精品店陈列的服饰精挑细选，欢迎你莅临就近的精品店欣赏。',
      'zh_Hant': '每家精品店陳列的服飾精挑細選，歡迎你蒞臨就近的精品店欣賞。',
    },
    'd91akxs6': {
      'en': 'BOOK AN APPOINTMENT',
      'zh_Hans': '预约',
      'zh_Hant': '預約',
    },
    'ralmr85m': {
      'en': 'FIND A BOUTIQUE',
      'zh_Hans': '搜寻精品店',
      'zh_Hant': '搜尋精品店',
    },
    'z6qln75c': {
      'en': 'HAUTE COUTURE',
      'zh_Hans': '高级订制服',
      'zh_Hant': '高級訂製服',
    },
    'h8y6h2v6': {
      'en': 'FASHION',
      'zh_Hans': '时装',
      'zh_Hant': '時裝',
    },
    '1or5u2sd': {
      'en': 'HIGH JEWELRY',
      'zh_Hans': '顶级珠宝',
      'zh_Hant': '頂級珠寶',
    },
    '3f452sz6': {
      'en': 'FINE JEWELRY',
      'zh_Hans': '高级珠宝',
      'zh_Hant': '高級珠寶',
    },
    'trk2lrp0': {
      'en': 'WATCHES',
      'zh_Hans': '腕表',
      'zh_Hant': '腕錶',
    },
    'qljfczgp': {
      'en': 'Shop online',
      'zh_Hans': '线上专属服务',
      'zh_Hant': '線上專屬服務',
    },
    'aidkc1we': {
      'en': 'EYEWEAR',
      'zh_Hans': '眼镜',
      'zh_Hant': '眼鏡',
    },
    'aqoawj2r': {
      'en': 'FRAGRANCE',
      'zh_Hans': '香水',
      'zh_Hant': '香水',
    },
    'qaisdbn4': {
      'en': 'MAKEUP',
      'zh_Hans': '彩妆',
      'zh_Hant': '彩妝',
    },
    'z2rz4r3t': {
      'en': 'SKINCARE',
      'zh_Hans': '护肤',
      'zh_Hant': '護膚',
    },
    'qnaf2nda': {
      'en': 'ABOUT CHANEL',
      'zh_Hans': '关于香奈儿',
      'zh_Hant': '關於香奈兒',
    },
    'mktahfj7': {
      'en': 'My Account',
      'zh_Hans': '我的账户',
      'zh_Hant': '我的賬戶',
    },
    '2s762oel': {
      'en': 'Find a store',
      'zh_Hans': '店铺搜寻',
      'zh_Hant': '店舖搜尋',
    },
    'ot0fgufm': {
      'en': 'High Contrast',
      'zh_Hans': '启用高对比',
      'zh_Hant': ' 啟用高對比',
    },
    'ubl86ltq': {
      'en': 'FASHION HOME',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'wtmjjn1w': {
      'en': 'LATEST SHOWS',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'skdquati': {
      'en': 'Spring-Summer 2024',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '0ilc8ljb': {
      'en': 'Avaliable in boutiques from March 2024',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'kj6il6wf': {
      'en': '2022/23 Métiers d’art',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'eggv1l6i': {
      'en': 'In Tokyo',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'uemer8gb': {
      'en': 'Cruise 2023/24',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'otl56wob': {
      'en': 'Available in boutiques from November 2023',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'pf6e6ztk': {
      'en': 'IN BOUTIQUES',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'nf0niyzv': {
      'en': 'Coco Neige 2023/24',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '40kuk2xo': {
      'en': 'Fall-Winter 2023/24',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '7c2lt9yg': {
      'en': 'Fall-Winter 2023/24 Pre-Collection',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'n29w60el': {
      'en': '2022/23 Métiers d’art',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'fhu7oqxq': {
      'en': 'The CHANEL 22 Bag',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'ip97sb8m': {
      'en': 'Ready-To-Wear',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '26gty7re': {
      'en': 'Shoes',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '0bd41hzt': {
      'en': 'Costume Jewelry',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'at90oexb': {
      'en': 'Small Leather Goods',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'n9z7l515': {
      'en': 'Eyewear',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'h77atspv': {
      'en': 'Other Accessories',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'u4ob48h8': {
      'en': 'SAVOIR-FAIRE',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'thztafh6': {
      'en':
          'Discover the savoir-faire of the 2022/23 Métiers d\'art collection',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '7k778kf0': {
      'en': 'CHANEL NEWS',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'qgij645g': {
      'en': 'Discover the latest news',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'y3rtof6k': {
      'en': 'Literary Rendezvous at Rue Cambon',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '0eo3f5n8': {
      'en': 'Discover the episodes',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'ec3qllhz': {
      'en': 'SERVICES',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'uo6vw0bo': {
      'en': 'A programme of services to preserve each CHANEL creation.',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '0dtgcknw': {
      'en': 'Find a Boutique',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'th58jwka': {
      'en': 'Book an appointment',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'hc7ux4zg': {
      'en': 'FASHION',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'uarlf2lp': {
      'en': 'Hello World',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'sadxbp6b': {
      'en': 'Home',
      'zh_Hans': '',
      'zh_Hant': '',
    },
  },
  // haute_couture_page
  {
    'ofhw0a5r': {
      'en': 'FALL-WINTER 2023/24',
      'zh_Hans': '2023/24  秋冬系列',
      'zh_Hant': '2023/24  秋冬系列',
    },
    'a3vboflu': {
      'en': 'SHOW',
      'zh_Hans': '时装展',
      'zh_Hant': '時裝展',
    },
    '7ypl20y1': {
      'en': 'SEE MORE',
      'zh_Hans': '浏览更多',
      'zh_Hant': '瀏覽更多',
    },
    'wpx8vuyi': {
      'en': 'SPRING-SUMMER 2023',
      'zh_Hans': '2023 春夏系列',
      'zh_Hant': '2023 春夏系列 ',
    },
    '3mt0gfye': {
      'en': 'SHOW',
      'zh_Hans': '时装展',
      'zh_Hant': '時裝展',
    },
    'bd64j3tk': {
      'en': 'SEE MORE',
      'zh_Hans': '浏览更多',
      'zh_Hant': '瀏覽更多',
    },
    '4hu3txy9': {
      'en': 'HAUTE COUTURE',
      'zh_Hans': '高级订制服',
      'zh_Hant': '高級訂製服',
    },
    'brskzqoo': {
      'en': 'FASHION',
      'zh_Hans': '时装',
      'zh_Hant': '時裝',
    },
    'bpeew2j0': {
      'en': 'HIGH JEWELRY',
      'zh_Hans': '顶级珠宝',
      'zh_Hant': '頂級珠寶',
    },
    'ljn2u3z5': {
      'en': 'FINE JEWELRY',
      'zh_Hans': '高级珠宝',
      'zh_Hant': '高級珠寶',
    },
    'lhah7c3u': {
      'en': 'WATCHES',
      'zh_Hans': '腕表',
      'zh_Hant': '腕錶',
    },
    'pakqtwrn': {
      'en': 'Shop online',
      'zh_Hans': '线上专属服务',
      'zh_Hant': '線上專屬服務',
    },
    'ru1fpwse': {
      'en': 'EYEWEAR',
      'zh_Hans': '眼镜',
      'zh_Hant': '眼鏡',
    },
    'xa3nrhg6': {
      'en': 'FRAGRANCE',
      'zh_Hans': '香水',
      'zh_Hant': '香水',
    },
    'g95o36ku': {
      'en': 'MAKEUP',
      'zh_Hans': '彩妆',
      'zh_Hant': '彩妝',
    },
    'pox94uul': {
      'en': 'SKINCARE',
      'zh_Hans': '护肤',
      'zh_Hant': '護膚',
    },
    '6j1qd20m': {
      'en': 'ABOUT CHANEL',
      'zh_Hans': '关于香奈儿',
      'zh_Hant': '關於香奈兒',
    },
    '9yic4ixx': {
      'en': 'My Account',
      'zh_Hans': '我的账户',
      'zh_Hant': '我的賬戶',
    },
    'pc7wmt9g': {
      'en': 'Find a store',
      'zh_Hans': '店铺搜寻',
      'zh_Hant': '店舖搜尋',
    },
    'aus5u56w': {
      'en': 'High Contrast',
      'zh_Hans': '启用高对比',
      'zh_Hant': ' 啟用高對比',
    },
    'w79triwn': {
      'en': 'Home',
      'zh_Hans': '',
      'zh_Hant': '',
    },
  },
  // haute_couture_detail_page
  {
    'mc0mbjib': {
      'en': 'FALL-WINTER 2023/24',
      'zh_Hans': '2023/24  秋冬系列',
      'zh_Hant': '2023/24  秋冬系列',
    },
    '3ncf7oxb': {
      'en': 'HAUTE COUTURE \nSHOW',
      'zh_Hans': '高级订制服时装展',
      'zh_Hant': '高級訂製服時裝展',
    },
    '9uqo3059': {
      'en':
          'Inspired by a Parisian allure, the CHANEL Fall-Winter 2023/24 Haute Couture collection imagined by Virginie Viard unveils a portrait of a delicate yet bold femininity. The collection, presented on the riverbanks of the Seine, is adorned with embroidered fruits and flowers motifs reminiscent of the still-lives dear to pictural arts. Silhouettes play with masculine codes, mixing together rigour and asymmetry, a self-confident and discreet figure.',
      'zh_Hans':
          'Virginie Viard设计的CHANEL 2023/24高级订制服系列以巴黎魅力为灵感，展现一份纤细又果敢的女性美。系列于塞纳河畔登场，服装上的水果与花卉刺绣，如同静物画家笔下的作品。服装设计带点刚阳元素，精湛及不对称的剪裁，塑造一位自信而含蓄的时尚女性形象',
      'zh_Hant':
          'Virginie Viard設計的CHANEL 2023/24高級訂製服系列以巴黎魅力為靈感，展現一份纖細又果敢的女性美。系列於塞納河畔登場，服裝上的水果與花卉刺繡，如同靜物畫家筆下的作品。服裝設計帶點剛陽元素，精湛及不對稱的剪裁，塑造一位自信而含蓄的時尚女性形象',
    },
    '1n0oq8z0': {
      'en': 'SEE THE LOOKS',
      'zh_Hans': '观看造型',
      'zh_Hant': '觀看造型',
    },
    'e6fbx5qb': {
      'en': 'Behind-the-Scenes of the show with Vanessa Paradis',
      'zh_Hans': 'Vanessa Paradis窥探时装展幕后花絮',
      'zh_Hant': 'Vanessa Paradis窺探時裝展幕後花絮',
    },
    'yyky2emb': {
      'en':
          'In the lead up to the CHANEL Fall-Winter 2023/24 Haute Couture show, Vanessa Paradis, French icon and House ambassador, catches a glimpse of the collection, inside the Haute Couture ateliers at 31, rue Cambon in Paris.',
      'zh_Hans':
          '2023/24秋冬高级订制服时装展举行在即，法国著名女星兼品牌大使Vanessa Paradis到访康朋街31号高级订制服工作室，一探系列制作的幕后风光。',
      'zh_Hant':
          '2023/24秋冬高級訂製服時裝展舉行在即，法國著名女星兼品牌大使Vanessa Paradis到訪康朋街31號高級訂製服工作室，一探系列製作的幕後風光。',
    },
    '34iyszqc': {
      'en': 'SEE THE FILM',
      'zh_Hans': '观看造型',
      'zh_Hant': '觀看影片',
    },
    'ne98fhb6': {
      'en': 'Bespoke Conversation with Vanessa Paradis',
      'zh_Hans': '与Vanessa Paradis对谈',
      'zh_Hant': '與Vanessa Paradis對談',
    },
    'ik6ubcsh': {
      'en':
          'Vanessa Paradis is the first guest of a series of bespoke conversations led by Géraldine Sarratia at the 31, rue Cambon, in Paris. Alongside the Fall-Winter 2023/24 Haute Couture show, she evokes the emotions conveyed by Haute Couture, the figure of the Parisienne, her relationship with time and creation.',
      'zh_Hans':
          'Vanessa Paradis担任Géraldine Sarratia主持、于康朋街31号举行的座谈第一位嘉宾，2023/24高级订制服时装展举行在即，她亦谈及高级订制服传递的强烈情感、巴黎人的时髦风格、她与时间及创意的关系等话题。',
      'zh_Hant':
          'Vanessa Paradis擔任Géraldine Sarratia主持、於康朋街31號舉行的座談第一位嘉賓，2023/24高級訂製服時裝展舉行在即，她亦談及高級訂製服傳遞的強烈情感、巴黎人的時髦風格、她與時間及創意的關係等話題。',
    },
    'grh3rzrg': {
      'en': 'Strolling on the Seine',
      'zh_Hans': '漫步塞纳河畔',
      'zh_Hant': '漫步塞納河畔',
    },
    '91ol5ems': {
      'en':
          'In the lead up to the CHANEL Fall-Winter 2023/24 Haute Couture show, Vanessa Paradis, French icon and House ambassador, catches a glimpse of the collection, inside the Haute Couture ateliers at 31, rue Cambon in Paris.',
      'zh_Hans':
          '法国著名影星兼品牌大使Vanessa Paradis身穿Virginie Viard设计的CHANEL 2023/24秋冬高级订制服系列，焕发系列蕴含的精致魅力及巴黎时尚神采。',
      'zh_Hant':
          '法國著名影星兼品牌大使Vanessa Paradis身穿Virginie Viard設計的CHANEL 2023/24秋冬高級訂製服系列，煥發系列蘊含的精緻魅力及巴黎時尚神采。',
    },
    'otw3h0x9': {
      'en': 'Photographs by Karim Sadli.',
      'zh_Hans': '摄影 : Karim Sadli',
      'zh_Hant': '攝影 : Karim Sadli',
    },
    'wh1ncguy': {
      'en': 'SEE THE LOOKS',
      'zh_Hans': 'SEE THE LOOKS',
      'zh_Hant': 'SEE THE LOOKS',
    },
    'nlgb5ye5': {
      'en': 'Ambassadors and Friends of the House',
      'zh_Hans': 'Ambassadors and Friends of the House',
      'zh_Hant': 'Ambassadors and Friends of the House',
    },
    '412g79wx': {
      'en':
          'Ambassadors and friends of the House Margaret Qualley, Sofia Coppola, Vanessa Paradis, Kendrick Lamar, Lupita Nyong’o, Riley Keough, William Chan, George Lucas, JR, Alma Jodorowsky and Liu Shishi attended the CHANEL Fall-Winter 2023/24 Haute Couture show presented on the riverbanks of the Seine, in Paris.',
      'zh_Hans': 'Ambassadors and Friends of the House',
      'zh_Hant': 'Ambassadors and Friends of the House',
    },
    'usulyccc': {
      'en': 'Caroline de Maigret on CHANEL Haute Couture',
      'zh_Hans': 'Caroline de Maigret on CHANEL Haute Couture',
      'zh_Hant': 'Caroline de Maigret on CHANEL Haute Couture',
    },
    'jg88r8dl': {
      'en':
          '\"By wearing an Haute Couture piece, you also wear the savoir-faire and time that was put into it. » House ambassador Caroline de Maigret, who opened the Fall-Winter 2023/24 Haute Couture show, shares her impressions on the collection and on CHANEL Haute Couture.',
      'zh_Hans': 'Ambassadors and Friends of the House',
      'zh_Hant': 'Ambassadors and Friends of the House',
    },
    '7fche8b8': {
      'en': 'SEE THE FILM',
      'zh_Hans': 'SEE THE FILM',
      'zh_Hant': 'SEE THE FILM',
    },
    'tz9ywli2': {
      'en': 'Parisienne allure',
      'zh_Hans': 'Caroline de Maigret on CHANEL Haute Couture',
      'zh_Hant': 'Caroline de Maigret on CHANEL Haute Couture',
    },
    '1zyf2kqz': {
      'en':
          'House ambassador Caroline de Maigret, embodies the Parisienne allure of the CHANEL Fall-Winter 2023/24 Haute Couture collection imagined by Virginie Viard captured by Karim Sadli.',
      'zh_Hans': 'Ambassadors and Friends of the House',
      'zh_Hant': 'Ambassadors and Friends of the House',
    },
    '5q1ls1jq': {
      'en': 'HAUTE COUTURE',
      'zh_Hans': '高级订制服',
      'zh_Hant': '高級訂製服',
    },
    '4tjpqgy4': {
      'en': 'FASHION',
      'zh_Hans': '时装',
      'zh_Hant': '時裝',
    },
    'y5th5uhl': {
      'en': 'HIGH JEWELRY',
      'zh_Hans': '顶级珠宝',
      'zh_Hant': '頂級珠寶',
    },
    'yfqvxlk2': {
      'en': 'FINE JEWELRY',
      'zh_Hans': '高级珠宝',
      'zh_Hant': '高級珠寶',
    },
    'csdb4vy4': {
      'en': 'WATCHES',
      'zh_Hans': '腕表',
      'zh_Hant': '腕錶',
    },
    'k3qhe5oq': {
      'en': 'Shop online',
      'zh_Hans': '线上专属服务',
      'zh_Hant': '線上專屬服務',
    },
    '14glpo6h': {
      'en': 'EYEWEAR',
      'zh_Hans': '眼镜',
      'zh_Hant': '眼鏡',
    },
    'lfqgk8b5': {
      'en': 'FRAGRANCE',
      'zh_Hans': '香水',
      'zh_Hant': '香水',
    },
    'ewu7thli': {
      'en': 'MAKEUP',
      'zh_Hans': '彩妆',
      'zh_Hant': '彩妝',
    },
    'um3grv8z': {
      'en': 'SKINCARE',
      'zh_Hans': '护肤',
      'zh_Hant': '護膚',
    },
    'rrrnocmm': {
      'en': 'ABOUT CHANEL',
      'zh_Hans': '关于香奈儿',
      'zh_Hant': '關於香奈兒',
    },
    'p5opcro7': {
      'en': 'My Account',
      'zh_Hans': '我的账户',
      'zh_Hant': '我的賬戶',
    },
    'gdlpth2v': {
      'en': 'Find a store',
      'zh_Hans': '店铺搜寻',
      'zh_Hant': '店舖搜尋',
    },
    'hzjyafbj': {
      'en': 'High Contrast',
      'zh_Hans': '启用高对比',
      'zh_Hant': ' 啟用高對比',
    },
    'qcqb4cr7': {
      'en': 'Home',
      'zh_Hans': '',
      'zh_Hant': '',
    },
  },
  // auth_page
  {
    'bcstsqu7': {
      'en': 'ACCOUNT',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'lny0ouux': {
      'en': 'SIGN IN',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'weany94y': {
      'en': 'WELCOME BACK.',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'kwtxxsfo': {
      'en': 'Sign in with your email and password.',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '3cdlx83i': {
      'en': 'Email',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    't13xlgpe': {
      'en': 'Password',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '382lklgk': {
      'en': 'Forgot password?',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'vdnkw1e5': {
      'en': 'Remember me (optional)',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '5dje2tyb': {
      'en': 'By signing in, I agree to CHANEL\'s ',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'fo9qk1ji': {
      'en': 'Privacy Policy',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'b1k12bbw': {
      'en': ' and ',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'gid84jtm': {
      'en': 'Legal Statement',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'fwa85a1a': {
      'en': '.',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'j80a14zv': {
      'en': 'SIGN IN',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '0r0tgyxe': {
      'en': 'CONTACT AN ADVISOR',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'cddjng74': {
      'en':
          'CHANEL Customer Care is available Monday to Sunday, 7 AM to 12 AM ET. to answer all your questions.',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'i82d04md': {
      'en': 'Please ',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '1j04o7zm': {
      'en': 'email us',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'xfk4laji': {
      'en': ', call ',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'nbo5lygl': {
      'en': 'FIND A STORE',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    't4l83i3l': {
      'en': 'NEWSLETTER',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '78wizd8f': {
      'en': 'REGISTER',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'ao0dpcl0': {
      'en':
          'Create an account and benefit from a more personal shopping experience, and quicker online checkout.',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'r8zhpmx7': {
      'en': 'All fields are mandatory.',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '88lkveq7': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'p041jd59': {
      'en': 'Mrs.',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'vzrv7ve3': {
      'en': 'Ms.',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '3xjg6k06': {
      'en': 'Mr.',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '0j2iwhmz': {
      'en': 'Miss',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'coj4cftk': {
      'en': 'Mx.',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'q8vt97e2': {
      'en': 'Dr.',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '7ganyy6o': {
      'en': 'Prefer  not  to say',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'e3yyzt3n': {
      'en': 'Title',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'gbpyvtr2': {
      'en': 'Search for an item...',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'ba8mc3ba': {
      'en': 'First name',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'omcf4dsh': {
      'en': 'Last name',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '1zn6ed64': {
      'en': 'Location of residence',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'kg44367q': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '0a0vi5iu': {
      'en': 'Hong Kong',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '2ybmggl3': {
      'en': 'Title',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'p0rkc7a4': {
      'en': 'Search for an item...',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '1mgl618g': {
      'en': 'Email',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'xures7ho': {
      'en': 'Password',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'q9lp84vc': {
      'en': 'By creating an account, I agree to CHANEL\'s ',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'u32smkk1': {
      'en': 'Privacy Policy',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'rtgvdkh9': {
      'en': ' and ',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'bppodldm': {
      'en': 'Legal Statement.',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'inrzovfx': {
      'en': 'CONTINUE',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'l0jiqsw9': {
      'en': 'Home',
      'zh_Hans': '',
      'zh_Hant': '',
    },
  },
  // CustomAppbar_with_bag
  {
    'aht36ait': {
      'en': 'CHANEL',
      'zh_Hans': 'CHANEL',
      'zh_Hant': 'CHANEL',
    },
  },
  // See_Looks_Btn
  {
    'kuih8pge': {
      'en': 'CHANEL',
      'zh_Hans': 'CHANEL',
      'zh_Hant': 'CHANEL',
    },
    '43me6dbp': {
      'en': 'COCO NEIGE',
      'zh_Hans': 'COCO NEIGE',
      'zh_Hant': 'COCO NEIGE',
    },
    '5ctni95r': {
      'en': 'SEE THE LOOKS',
      'zh_Hans': '观看造型',
      'zh_Hant': '觀看造型',
    },
  },
  // Custom_Appbar
  {
    '1mtxp3ot': {
      'en': 'CHANEL',
      'zh_Hans': 'CHANEL',
      'zh_Hant': 'CHANEL',
    },
  },
  // Custom_Footer
  {
    '22o2anu6': {
      'en': 'CHANEL',
      'zh_Hans': 'CHANEL',
      'zh_Hant': 'CHANEL',
    },
    'awgoywoq': {
      'en': 'EXPLORE CHANEL.COM',
      'zh_Hans': '浏览CHANEL.com',
      'zh_Hant': '瀏覽CHANEL.com',
    },
    '0597kwee': {
      'en': 'Haute Couture',
      'zh_Hans': '高级订制服',
      'zh_Hant': '高級訂製服',
    },
    'jfnb0u4d': {
      'en': 'Fashion',
      'zh_Hans': '时装',
      'zh_Hant': '時裝',
    },
    'jxwrdhvs': {
      'en': 'High Jewelry',
      'zh_Hans': '顶级珠宝',
      'zh_Hant': '頂級珠寶',
    },
    'ow7hi7a5': {
      'en': 'Fine Jewelry',
      'zh_Hans': '高级珠宝',
      'zh_Hant': '高級珠寶',
    },
    'rsbdb8ll': {
      'en': 'Watches',
      'zh_Hans': '腕表',
      'zh_Hant': '腕錶',
    },
    're9ymaik': {
      'en': 'Eyewear',
      'zh_Hans': '眼镜',
      'zh_Hant': '眼鏡',
    },
    'koyiyjm1': {
      'en': 'Fragrance',
      'zh_Hans': '香水',
      'zh_Hant': '香水',
    },
    'aiekdjyf': {
      'en': 'Makeup',
      'zh_Hans': '彩妆',
      'zh_Hant': '彩妝',
    },
    '8ri4ycd1': {
      'en': 'Skincare',
      'zh_Hans': '护肤',
      'zh_Hant': '護膚',
    },
    '54irpshf': {
      'en': 'Sitemap',
      'zh_Hans': '网站地图',
      'zh_Hant': '網站地圖',
    },
    '9m3o98cq': {
      'en': 'ONLINE SERVICES',
      'zh_Hans': '线上专属服务',
      'zh_Hant': '線上專屬服務',
    },
    '6pr5gncc': {
      'en': 'Payment Methods',
      'zh_Hans': '付款方式',
      'zh_Hant': '付款方式',
    },
    'nk8y5gwg': {
      'en': 'Shipping Options',
      'zh_Hans': '送货选项',
      'zh_Hant': '送貨選項',
    },
    'pp5ajiak': {
      'en': 'My Account',
      'zh_Hans': '我的账户',
      'zh_Hant': '我的賬戶',
    },
    'r1r5fpb2': {
      'en': 'Returnss',
      'zh_Hans': '退货',
      'zh_Hant': '退貨',
    },
    'wkix0lkd': {
      'en': 'FAQ',
      'zh_Hans': '常见问题',
      'zh_Hant': '常見問題',
    },
    'eds2hoqr': {
      'en': 'Care & Services',
      'zh_Hans': '维修和保养服务',
      'zh_Hant': '維修和保養服務',
    },
    '6uwf6msa': {
      'en': 'BOUTIQUE SERVICES',
      'zh_Hans': '精品店服务',
      'zh_Hant': '精品店服務',
    },
    'uylm6qym': {
      'en': 'Store Locaator',
      'zh_Hans': '店铺搜寻',
      'zh_Hant': '店舖搜尋',
    },
    'nmx13ga6': {
      'en': 'Book an Appointment',
      'zh_Hans': '线上预约服务',
      'zh_Hant': '線上預約服務',
    },
    'z8vp7ta6': {
      'en': 'THE HOUSE OF CHANEL',
      'zh_Hans': '品牌',
      'zh_Hant': 'CHANEL品牌',
    },
    'slq4yf0p': {
      'en': 'Careers',
      'zh_Hans': '工作机会',
      'zh_Hant': '工作機會',
    },
    'ps88ykhc': {
      'en': 'Legal',
      'zh_Hans': '法律声明',
      'zh_Hant': '法律聲明',
    },
    'oh772l46': {
      'en': 'Privacy',
      'zh_Hans': '私隐政策',
      'zh_Hant': '私隱政策 ',
    },
    'gn3bzf4c': {
      'en': 'Do Not Sell or Share My Personal Information',
      'zh_Hans': '请勿出售或分享我的个人信息',
      'zh_Hant': '請勿出售或分享我的個人信息',
    },
    'vhzpxiex': {
      'en': 'Report to Society',
      'zh_Hans': '社会责任报告',
      'zh_Hant': '社會責任報告',
    },
    'fnutcivb': {
      'en': 'Fighting Counterfeits',
      'zh_Hans': '打击仿冒',
      'zh_Hant': '打擊仿冒',
    },
    '0q55vn8w': {
      'en': 'Accessibility',
      'zh_Hans': '无障碍',
      'zh_Hant': '無障礙',
    },
    'fsd41y90': {
      'en': 'Change location and language',
      'zh_Hans': '更改位置和语言',
      'zh_Hant': '更改位置和語言',
    },
  },
  // Custom_Appbar_With_White_Color
  {
    '83iatzca': {
      'en': 'CHANEL',
      'zh_Hans': 'CHANEL',
      'zh_Hant': 'CHANEL',
    },
  },
  // Watch_Film_Btn
  {
    'q3l958oc': {
      'en': 'SEE THE FILM',
      'zh_Hans': '观看影片',
      'zh_Hant': '觀看影片',
    },
  },
  // Custom_Appbar_With_Black_Color
  {
    'gl029hrj': {
      'en': 'CHANEL',
      'zh_Hans': 'CHANEL',
      'zh_Hant': 'CHANEL',
    },
  },
  // Miscellaneous
  {
    'xkh0kzsn': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'qk5tlox4': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'sdt6o8nz': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'tpelganx': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '0lfkvw9i': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '0bfmfqza': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'gcjr7zg4': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'jq57om8b': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'arptq5ln': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'dro1suk3': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'mbwotya4': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'kxyh4xov': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'pj4esagr': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'oxx5hszw': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '7jrp12ro': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'wwhsbdho': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '9undwctf': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '3x4pmbub': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '2l48nb8y': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'ddtfox6m': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'wjebo6nr': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'vso0p85p': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'wqkawp41': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
  },
].reduce((a, b) => a..addAll(b));
