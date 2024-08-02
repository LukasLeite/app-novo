import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'id', 'ms'];

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
    String? idText = '',
    String? msText = '',
  }) =>
      [enText, idText, msText][languageIndex] ?? '';

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
  // p2login
  {
    '3p97u62u': {
      'en': 'Olá!',
      'id': 'Selamat Datang kembali!',
      'ms': 'Selamat kembali!',
    },
    'lfzvgi5q': {
      'en': '',
      'id': 'Kata sandi',
      'ms': 'Kata laluan',
    },
    'wt8sx5du': {
      'en': 'Enter your password here...',
      'id': 'Masukkan kata sandi Anda di sini...',
      'ms': 'Masukkan kata laluan anda di sini...',
    },
    's8bicxzh': {
      'en': 'Forgot Password?',
      'id': 'Tidak ingat kata sandi?',
      'ms': 'Lupa kata laluan?',
    },
    'm9klj9ah': {
      'en': 'Login',
      'id': 'Gabung',
      'ms': 'Log masuk',
    },
    'tcu0c8bu': {
      'en': 'Don\'t have an account?',
      'id': 'Tidak punya akun?',
      'ms': 'Tiada akaun?',
    },
    'kk2rdqi2': {
      'en': 'Create Account',
      'id': 'Buat Akun',
      'ms': 'Buat akaun',
    },
    'iha5socs': {
      'en': 'Home',
      'id': 'Rumah',
      'ms': 'Rumah',
    },
  },
  // p4recsenha
  {
    '3hcuc8v6': {
      'en': 'Recuperção de Senha',
      'id': 'Tidak ingat kata sandi',
      'ms': 'Lupa kata laluan',
    },
    'sjjd1jb9': {
      'en': 'Não lembra a senha? ',
      'id':
          'Tidak ingat kata sandi Anda? Masukkan email yang terkait dengan akun Anda di bawah ini dan kami akan mengirimkan tautan baru kepada Anda.',
      'ms':
          'Tidak ingat kata laluan anda? Masukkan e-mel yang dikaitkan dengan akaun anda di bawah dan kami akan menghantar pautan baharu kepada anda.',
    },
    'tzm5opaa': {
      'en': '',
      'id': 'Alamat email',
      'ms': 'Alamat emel',
    },
    'uvsotzng': {
      'en': 'Digite um e-mail válido',
      'id': 'Tolong masukkan email yang benar...',
      'ms': 'Sila masukkan e-mel yang sah...',
    },
    'j8wt1lt1': {
      'en': 'Criar',
      'id': '',
      'ms': '',
    },
    'bofkrbb7': {
      'en': 'Não lembra a senha? ',
      'id': '',
      'ms': '',
    },
    'fodyhvb4': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'h1wcqqgt': {
      'en': 'Digite um e-mail válido',
      'id': '',
      'ms': '',
    },
    'r4f04ed5': {
      'en': 'Criar',
      'id': '',
      'ms': '',
    },
    '8p6xd6cl': {
      'en': 'Home',
      'id': 'Rumah',
      'ms': 'Rumah',
    },
  },
  // p6menucolaboradores
  {
    'qrxn5crt': {
      'en': 'Meu perfil',
      'id': 'Profil saya',
      'ms': 'Profil saya',
    },
    'fyxsf6vn': {
      'en': 'Menu',
      'id': 'Pengaturan akun',
      'ms': 'Tetapan Akaun',
    },
    'h43llaan': {
      'en': 'Ponto',
      'id': 'Ganti kata sandi',
      'ms': 'Tukar kata laluan',
    },
    'b1lw0hfu': {
      'en': 'Jornadas',
      'id': 'Sunting profil',
      'ms': 'Sunting profil',
    },
    'hsk8e3kx': {
      'en': 'Plantões',
      'id': '',
      'ms': '',
    },
    'eabjkx47': {
      'en': 'Banco de Horas',
      'id': '',
      'ms': '',
    },
    'uvbagkmk': {
      'en': 'Editar Perfil',
      'id': '',
      'ms': '',
    },
    'p3mhx7az': {
      'en': 'Emissão de Ponto',
      'id': '',
      'ms': '',
    },
    'abqf147c': {
      'en': 'Log Out',
      'id': 'Keluar',
      'ms': 'Log keluar',
    },
    'xcpar81h': {
      'en': 'Meu perfil',
      'id': '',
      'ms': '',
    },
    'p71yl41g': {
      'en': 'Menu',
      'id': '',
      'ms': '',
    },
    'tp3u1o8h': {
      'en': 'Ponto',
      'id': '',
      'ms': '',
    },
    'w8mac1ru': {
      'en': 'Jornadas',
      'id': '',
      'ms': '',
    },
    'pjppj2fy': {
      'en': 'Plantões',
      'id': '',
      'ms': '',
    },
    'ns5j458c': {
      'en': 'Banco de Horas',
      'id': '',
      'ms': '',
    },
    'nsims7ee': {
      'en': 'Editar Perfil',
      'id': '',
      'ms': '',
    },
    '6rfq7ru7': {
      'en': 'Emissão de Ponto',
      'id': '',
      'ms': '',
    },
    'g6j2lqpe': {
      'en': 'Log Out',
      'id': '',
      'ms': '',
    },
    'o3dp9tss': {
      'en': '__',
      'id': '__',
      'ms': '__',
    },
  },
  // p8editarperfilcolaborador
  {
    '4no7ue4a': {
      'en': 'Your Name',
      'id': '',
      'ms': '',
    },
    '2rqce1pj': {
      'en': 'The email associated with this account is:',
      'id': '',
      'ms': '',
    },
    '1p6qxofg': {
      'en': 'Editar',
      'id': '',
      'ms': '',
    },
    '20uycztj': {
      'en': 'Editar Perfil',
      'id': '',
      'ms': '',
    },
  },
  // projectDetailsHealthAi
  {
    'mxf4vrjw': {
      'en': 'HealthAi',
      'id': 'KesehatanAi',
      'ms': 'KesihatanAi',
    },
    'wsgonkz2': {
      'en': 'Client Acquisition for Q3',
      'id': 'Akuisisi Klien untuk Q3',
      'ms': 'Pemerolehan Pelanggan untuk S3',
    },
    'ynyuwhqo': {
      'en': 'Next Action',
      'id': 'Tindakan Selanjutnya',
      'ms': 'Tindakan Seterusnya',
    },
    'zk7z07v0': {
      'en': 'Tuesday, 10:00am',
      'id': 'Selasa, 10:00',
      'ms': 'Selasa, 10:00 pagi',
    },
    'lux9j0yp': {
      'en': 'In Progress',
      'id': 'Sedang berlangsung',
      'ms': 'Sedang Berlangsung',
    },
    'ry6jvd0g': {
      'en': 'Contract Details',
      'id': 'Detail Kontrak',
      'ms': 'Butiran Kontrak',
    },
    'hu32scl5': {
      'en': '\$125,000',
      'id': '\$125.000',
      'ms': '\$125,000',
    },
    'sfu6o269': {
      'en':
          'Additional Details around this contract and who is working on it in this card!',
      'id':
          'Detail Tambahan seputar kontrak ini dan siapa yang mengerjakannya di kartu ini!',
      'ms':
          'Butiran Tambahan mengenai kontrak ini dan siapa yang mengusahakannya dalam kad ini!',
    },
    '5sv9a4ka': {
      'en': 'Mark as Complete',
      'id': 'Tandai sebagai Selesai',
      'ms': 'Tandai sebagai Selesai',
    },
    'rrgcwkj1': {
      'en': 'Contract Details',
      'id': 'Detail Kontrak',
      'ms': 'Butiran Kontrak',
    },
    '8bwk4oui': {
      'en': '\$67,000',
      'id': '\$67.000',
      'ms': '\$67,000',
    },
    'p2hoxaq9': {
      'en':
          'Additional Details around this contract and who is working on it in this card!',
      'id':
          'Detail Tambahan seputar kontrak ini dan siapa yang mengerjakannya di kartu ini!',
      'ms':
          'Butiran Tambahan mengenai kontrak ini dan siapa yang mengusahakannya dalam kad ini!',
    },
    'ww95wm3k': {
      'en': 'Mark as Complete',
      'id': 'Tandai sebagai Selesai',
      'ms': 'Tandai sebagai Selesai',
    },
    '54l7ivhw': {
      'en': 'Home',
      'id': 'Rumah',
      'ms': 'Rumah',
    },
  },
  // p8cadastrarfuncionario
  {
    '7xmbta3y': {
      'en': 'Cadastro de Funcionários',
      'id': '',
      'ms': '',
    },
    '935csalg': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'cff9i2kg': {
      'en': 'Digite o nome do fúncionario',
      'id': '',
      'ms': '',
    },
    '86f8erd9': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '1yaxr3yl': {
      'en': 'Digite o ID externo',
      'id': '',
      'ms': '',
    },
    'iodun6ec': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '2qxs9s93': {
      'en': 'Digite o CPF',
      'id': '',
      'ms': '',
    },
    '7fxi8zz8': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'ggvlpus5': {
      'en': 'Digite um e-mail válido',
      'id': '',
      'ms': '',
    },
    'bvgq2e0v': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '8wooi039': {
      'en': 'Digite o cargo',
      'id': '',
      'ms': '',
    },
    'bsi6gchh': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'mewftww3': {
      'en': 'Digite o cliente associado',
      'id': '',
      'ms': '',
    },
    'vp66hnon': {
      'en': 'Criar',
      'id': '',
      'ms': '',
    },
    'w4dqmp7v': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'ozdtgfyu': {
      'en': 'Digite o nome do fúncionario',
      'id': '',
      'ms': '',
    },
    'y1qml00g': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'cnpyjkdq': {
      'en': 'Digite o ID externo',
      'id': '',
      'ms': '',
    },
    'a9ua7dvp': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'o9xwfbiu': {
      'en': 'Digite o CPF',
      'id': '',
      'ms': '',
    },
    '3xynfgtm': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '3qb4e24v': {
      'en': 'Digite um e-mail válido',
      'id': '',
      'ms': '',
    },
    '8wiixopa': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'fcn03t3p': {
      'en': 'Digite o cargo',
      'id': '',
      'ms': '',
    },
    '69vcqilu': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'ag5p465y': {
      'en': 'Digite o cliente associado',
      'id': '',
      'ms': '',
    },
    'f6dr4p18': {
      'en': 'Criar',
      'id': '',
      'ms': '',
    },
    'vij555f0': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // p8cadastrodeclientes
  {
    '9h2gyu1m': {
      'en': 'Cadastro de Clientes',
      'id': '',
      'ms': '',
    },
    'zun9w0dj': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'cfhye359': {
      'en': 'Digite o nome fantasia',
      'id': '',
      'ms': '',
    },
    's892crt2': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '01dsbyt2': {
      'en': 'Digite a razão social',
      'id': '',
      'ms': '',
    },
    'vuckma72': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '3lxlxkr8': {
      'en': 'Digite o ID do sistema externo',
      'id': '',
      'ms': '',
    },
    'pq9te78p': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'ywf4wwoz': {
      'en': 'Digite um e-mail válido',
      'id': '',
      'ms': '',
    },
    'of34pcgt': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'uq63p2qb': {
      'en': 'Endereço',
      'id': '',
      'ms': '',
    },
    'ltxwcz6r': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'u7wwz74q': {
      'en': 'Telefone',
      'id': '',
      'ms': '',
    },
    'ezmjgu10': {
      'en': 'Criar',
      'id': '',
      'ms': '',
    },
    'iukhidef': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'mrivdqcu': {
      'en': 'Digite o nome fantasia',
      'id': '',
      'ms': '',
    },
    'zv478zvq': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'b6nf97jb': {
      'en': 'Digite a razão social',
      'id': '',
      'ms': '',
    },
    'j10gqn8s': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'mkhmdguk': {
      'en': 'Digite o ID do sistema externo',
      'id': '',
      'ms': '',
    },
    'pqz34bub': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'ktlt230z': {
      'en': 'Digite um e-mail válido',
      'id': '',
      'ms': '',
    },
    'mto4xm6p': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'v2od1q32': {
      'en': 'Endereço',
      'id': '',
      'ms': '',
    },
    'keqkyd3w': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'x08d79cv': {
      'en': 'Telefone',
      'id': '',
      'ms': '',
    },
    'q1kpbynv': {
      'en': 'Criar',
      'id': '',
      'ms': '',
    },
    'bijcgqpw': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // p8criarcargos
  {
    'zteld45b': {
      'en': 'Criar Cargos',
      'id': '',
      'ms': '',
    },
    '2o5qj8w4': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'cttomfmy': {
      'en': 'Digite o nome do cargo',
      'id': '',
      'ms': '',
    },
    'psk4hteg': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '3px7e7ii': {
      'en': 'Digite o ID do funcionário',
      'id': '',
      'ms': '',
    },
    'gswotjdg': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'q83glqw4': {
      'en': 'Digite o ID do autorizador',
      'id': '',
      'ms': '',
    },
    'fzvu4r61': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '04pvldcp': {
      'en': 'Digite o nível',
      'id': '',
      'ms': '',
    },
    'xm7paxom': {
      'en': 'Criar',
      'id': '',
      'ms': '',
    },
    '7qapp4sr': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'cckr3czl': {
      'en': 'Digite o nome do cargo',
      'id': '',
      'ms': '',
    },
    'bcp77xee': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'zxpr985s': {
      'en': 'Digite o ID do funcionário',
      'id': '',
      'ms': '',
    },
    'sbbrk1fn': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'piojwi4o': {
      'en': 'Digite o ID do autorizador',
      'id': '',
      'ms': '',
    },
    'b1574uij': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'v2i0ukuk': {
      'en': 'Digite o nível',
      'id': '',
      'ms': '',
    },
    'caevoavm': {
      'en': 'Criar',
      'id': '',
      'ms': '',
    },
    'u9aax9l3': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // p8excluircargos
  {
    'wmbdc739': {
      'en': 'Excluir Cargos',
      'id': '',
      'ms': '',
    },
    'ikb7q3p7': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'zkv415vj': {
      'en': 'Digite o nome do cargo',
      'id': '',
      'ms': '',
    },
    'h08rvvr6': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'ochv5z52': {
      'en': 'Digite o ID do funcionário',
      'id': '',
      'ms': '',
    },
    'vykh1yfh': {
      'en': 'Excluir',
      'id': '',
      'ms': '',
    },
    'lkei3cou': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'jpf1c71g': {
      'en': 'Digite o nome do cargo',
      'id': '',
      'ms': '',
    },
    'h61033g1': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '3yc6z0n7': {
      'en': 'Digite o ID do funcionário',
      'id': '',
      'ms': '',
    },
    '112evfl1': {
      'en': 'Excluir',
      'id': '',
      'ms': '',
    },
    '14rsml14': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // gestoPonto
  {
    'rr1z62mr': {
      'en': 'Gestão de Jornada de trabalho',
      'id': '',
      'ms': '',
    },
    'rhu8v7ep': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '0rduxz71': {
      'en': 'Horário de término',
      'id': '',
      'ms': '',
    },
    '8tani9tm': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'a7uk0ad3': {
      'en': 'Insira o nome  do  plantão',
      'id': '',
      'ms': '',
    },
    'du62mba6': {
      'en': 'Salvar',
      'id': '',
      'ms': '',
    },
    'vg711apy': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // teste
  {
    'ao1rxdix': {
      'en': 'Horas \ntrabalhadas',
      'id': '',
      'ms': '',
    },
    'ric3o1f9': {
      'en': 'Hello World',
      'id': '',
      'ms': '',
    },
    'hk6kk99g': {
      'en': 'Label here...',
      'id': '',
      'ms': '',
    },
    'p1q8v8rt': {
      'en': 'Example 2',
      'id': '',
      'ms': '',
    },
    '6rucwj2o': {
      'en': 'Tab View 2',
      'id': '',
      'ms': '',
    },
    '83eavec9': {
      'en': 'Example 3',
      'id': '',
      'ms': '',
    },
    'qaqnj1cj': {
      'en': 'Tab View 3',
      'id': '',
      'ms': '',
    },
    'u9mwpx1c': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // p3criarconta
  {
    'f48ib19p': {
      'en': 'Criar Conta',
      'id': '',
      'ms': '',
    },
    'tjnr3bnj': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'b0x4qb6o': {
      'en': 'Digite um e-mail válido',
      'id': '',
      'ms': '',
    },
    'mko9g4q2': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'zfccs3xe': {
      'en': 'Digite sua senha',
      'id': '',
      'ms': '',
    },
    'zioc4noc': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '11v47nnk': {
      'en': 'Repita sua senha',
      'id': '',
      'ms': '',
    },
    'piok47v0': {
      'en': 'Criar',
      'id': '',
      'ms': '',
    },
    'c9n16o61': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '7z9p7vnh': {
      'en': 'Digite um e-mail válido',
      'id': '',
      'ms': '',
    },
    'ibxl9soe': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'jkn8cxji': {
      'en': 'Digite sua senha',
      'id': '',
      'ms': '',
    },
    'zsnry7xx': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'zgcgtc4k': {
      'en': 'Repita sua senha',
      'id': '',
      'ms': '',
    },
    'hitfhxuq': {
      'en': 'Criar',
      'id': '',
      'ms': '',
    },
    'ictt3y68': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // Pontoeletronico
  {
    'gm89755x': {
      'en': 'Entrada',
      'id': '',
      'ms': '',
    },
    'zepjlfw0': {
      'en': 'Café',
      'id': '',
      'ms': '',
    },
    'u6gazjxe': {
      'en': 'Retorno',
      'id': '',
      'ms': '',
    },
    '7z8ffxud': {
      'en': 'Fim',
      'id': '',
      'ms': '',
    },
    '39vzw62s': {
      'en': 'Ponto Eletrônico',
      'id': '',
      'ms': '',
    },
    'drpxhixz': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // p8centraldejornadas
  {
    'tahdtjmb': {
      'en': 'Jornadas ',
      'id': '',
      'ms': '',
    },
    'xa1nosm5': {
      'en': 'Criar ',
      'id': '',
      'ms': '',
    },
    'unwv0zpx': {
      'en': 'Excluir',
      'id': '',
      'ms': '',
    },
    'wfqew5et': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // p8criarplantao
  {
    '0ktjes7x': {
      'en': 'Criar Plantão',
      'id': '',
      'ms': '',
    },
    'xps77u7p': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'o6b4zh2f': {
      'en': 'Digite o ID',
      'id': '',
      'ms': '',
    },
    'q3g7k48w': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'lo85cooh': {
      'en': 'Nome do plantão',
      'id': '',
      'ms': '',
    },
    'lo9vnxvf': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'w0d5szti': {
      'en': 'Pontual ou recorrente?',
      'id': '',
      'ms': '',
    },
    'n9gkgdj4': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'tx8njcd8': {
      'en': 'ID dos Colaboradores',
      'id': '',
      'ms': '',
    },
    '2oh2g18h': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'g3j0u74w': {
      'en': 'Digite as horas do plantão',
      'id': '',
      'ms': '',
    },
    'ti40cf33': {
      'en': 'Criar',
      'id': '',
      'ms': '',
    },
    'ck4cfcra': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'bdx2erm5': {
      'en': 'Digite o ID',
      'id': '',
      'ms': '',
    },
    'w7folf18': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '7allixpj': {
      'en': 'Nome do plantão',
      'id': '',
      'ms': '',
    },
    '3ajd8fzv': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'ooa064tu': {
      'en': 'Pontual ou recorrente?',
      'id': '',
      'ms': '',
    },
    'r4oug26x': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'jzgtg35m': {
      'en': 'ID dos Colaboradores',
      'id': '',
      'ms': '',
    },
    'bke4cciy': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '3qo6y48e': {
      'en': 'Digite as horas do plantão',
      'id': '',
      'ms': '',
    },
    'f0vlkd5u': {
      'en': 'Criar',
      'id': '',
      'ms': '',
    },
    'g4tm3crx': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // p8criarresponsabilidade
  {
    'qov3iyf7': {
      'en': 'Criar Responsabilidade',
      'id': '',
      'ms': '',
    },
    'ildvps5v': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '4r31mj6n': {
      'en': 'Digite o ID',
      'id': '',
      'ms': '',
    },
    'o96obzmr': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'ez3trxxg': {
      'en': 'Descrição',
      'id': '',
      'ms': '',
    },
    'h8z4q1au': {
      'en': 'Criar',
      'id': '',
      'ms': '',
    },
    'fgzzclmt': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '51pn4175': {
      'en': 'Digite o ID',
      'id': '',
      'ms': '',
    },
    '1ur345vl': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'nu6afa32': {
      'en': 'Descrição',
      'id': '',
      'ms': '',
    },
    'x0tqp4zs': {
      'en': 'Criar',
      'id': '',
      'ms': '',
    },
    '1up8ml0k': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // p8criarprojeto
  {
    '7mjzm39b': {
      'en': 'Criar Projeto',
      'id': '',
      'ms': '',
    },
    '2t18jaxj': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'swo720dw': {
      'en': 'Digite o ID',
      'id': '',
      'ms': '',
    },
    't6fzfyic': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'i8dyhjpv': {
      'en': 'Nome do projeto',
      'id': '',
      'ms': '',
    },
    'lcakdgi7': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'frmpo7om': {
      'en': 'referencia cliente',
      'id': '',
      'ms': '',
    },
    'd95wrrpt': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'zvxdpe69': {
      'en': 'Digite o ID do cliente',
      'id': '',
      'ms': '',
    },
    'srkg063k': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'owfe14y3': {
      'en': 'Início',
      'id': '',
      'ms': '',
    },
    'ikv2aa98': {
      'en': '',
      'id': '',
      'ms': '',
    },
    's3fuz1nm': {
      'en': 'Fim',
      'id': '',
      'ms': '',
    },
    '6s9frcug': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'xewnukxr': {
      'en': 'Horas mensais',
      'id': '',
      'ms': '',
    },
    'oaiwbpyd': {
      'en': 'Criar',
      'id': '',
      'ms': '',
    },
    'lh20al5s': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'qqe6k0sz': {
      'en': 'Digite o ID',
      'id': '',
      'ms': '',
    },
    'ymram7w8': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'l0ck10y7': {
      'en': 'Nome do projeto',
      'id': '',
      'ms': '',
    },
    'yldmqekr': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'ki2s3knw': {
      'en': 'referencia cliente',
      'id': '',
      'ms': '',
    },
    'z01hrwsa': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '06jmf1bq': {
      'en': 'Digite o ID do cliente',
      'id': '',
      'ms': '',
    },
    'ysmrh5ci': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'u93btohk': {
      'en': 'Início',
      'id': '',
      'ms': '',
    },
    '3ctlrl8h': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'cwops9gl': {
      'en': 'Fim',
      'id': '',
      'ms': '',
    },
    'v0fruerp': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'wfvgskww': {
      'en': 'Horas mensais',
      'id': '',
      'ms': '',
    },
    'ntku0j7g': {
      'en': 'Criar',
      'id': '',
      'ms': '',
    },
    'zfj4y8sz': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // p8registrarausencia
  {
    'm0fv6vtt': {
      'en': 'Registro de Ausências',
      'id': '',
      'ms': '',
    },
    'c9od0r4s': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '3rqs6tsm': {
      'en': 'Digite o ID do colaborador',
      'id': '',
      'ms': '',
    },
    'ctla5lk6': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'sa95wpww': {
      'en': 'Digite o ID do Autorizante',
      'id': '',
      'ms': '',
    },
    'fkjmsfiv': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '4bdlxdl9': {
      'en': 'Data Inicial',
      'id': '',
      'ms': '',
    },
    'y2xpoitq': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '5i9umcsj': {
      'en': 'Data Final',
      'id': '',
      'ms': '',
    },
    'gzjcs3df': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'lghz3q7t': {
      'en': 'Hora Inicial',
      'id': '',
      'ms': '',
    },
    'ppddlopi': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'mo86atru': {
      'en': 'Hora Final',
      'id': '',
      'ms': '',
    },
    'slmps3zz': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'cbr6e3rg': {
      'en': 'Justificativa',
      'id': '',
      'ms': '',
    },
    '5ob0d72z': {
      'en': 'Criar',
      'id': '',
      'ms': '',
    },
    'dtio5did': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '4czu8qzw': {
      'en': 'Digite o ID do colaborador',
      'id': '',
      'ms': '',
    },
    'qpskhirc': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'a195jsq0': {
      'en': 'Digite o ID do Autorizante',
      'id': '',
      'ms': '',
    },
    'px048cs1': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '0czgak5j': {
      'en': 'Data Inicial',
      'id': '',
      'ms': '',
    },
    'f5uvbp0k': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'xgug1elk': {
      'en': 'Data Final',
      'id': '',
      'ms': '',
    },
    'ujr4j69h': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '0ulximxp': {
      'en': 'Hora Inicial',
      'id': '',
      'ms': '',
    },
    'wp9jxclp': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '66z62cpe': {
      'en': 'Hora Final',
      'id': '',
      'ms': '',
    },
    '2ypargue': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'wwmg1fff': {
      'en': 'Justificativa',
      'id': '',
      'ms': '',
    },
    '1z1kx979': {
      'en': 'Criar',
      'id': '',
      'ms': '',
    },
    '2b41wntv': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // p8criarausencia
  {
    'owrxalth': {
      'en': 'Avisar Ausências',
      'id': '',
      'ms': '',
    },
    'cu4pxijg': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '8qgw4kb0': {
      'en': 'Digite o ID do colaborador',
      'id': '',
      'ms': '',
    },
    '9ysvwd12': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'x0f2r1fs': {
      'en': 'Digite o ID do Autorizante',
      'id': '',
      'ms': '',
    },
    '1fjrpgy1': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '9lqg9va3': {
      'en': 'Data Inicial',
      'id': '',
      'ms': '',
    },
    'zovgjj5s': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'vcp9m7lo': {
      'en': 'Data Final',
      'id': '',
      'ms': '',
    },
    'fv8wcq2q': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'kggf5zau': {
      'en': 'Hora Inicial',
      'id': '',
      'ms': '',
    },
    'ot8pz22j': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'zsye6mjk': {
      'en': 'Hora Final',
      'id': '',
      'ms': '',
    },
    'uo3yrh3b': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'lsrkhcx9': {
      'en': 'Justificativa',
      'id': '',
      'ms': '',
    },
    '2mnag7o2': {
      'en': 'Criar',
      'id': '',
      'ms': '',
    },
    'fmh8hsdc': {
      'en': '',
      'id': '',
      'ms': '',
    },
    't4ve42wu': {
      'en': 'Digite o ID do colaborador',
      'id': '',
      'ms': '',
    },
    'gb0agtx3': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'qchu56y0': {
      'en': 'Digite o ID do Autorizante',
      'id': '',
      'ms': '',
    },
    'ss2cdzi2': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '56jwt9cb': {
      'en': 'Data Inicial',
      'id': '',
      'ms': '',
    },
    'jthu5m5r': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'bqtb8qjf': {
      'en': 'Data Final',
      'id': '',
      'ms': '',
    },
    'nzj2kkf4': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'sfjnlt0t': {
      'en': 'Hora Inicial',
      'id': '',
      'ms': '',
    },
    'ymwc9lih': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'dh3hvfh9': {
      'en': 'Hora Final',
      'id': '',
      'ms': '',
    },
    'ow3oej5c': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'rry7jz5i': {
      'en': 'Justificativa',
      'id': '',
      'ms': '',
    },
    '3p16jmfd': {
      'en': 'Criar',
      'id': '',
      'ms': '',
    },
    'hokehw4y': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // p8excluirclientes
  {
    'ttj85j06': {
      'en': 'Excluir Clientes',
      'id': '',
      'ms': '',
    },
    '3dnrlon3': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'zlqn4u0d': {
      'en': 'Digite o nome fantasia',
      'id': '',
      'ms': '',
    },
    'zoig9xai': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '4a6g83a7': {
      'en': 'Digite a razão social',
      'id': '',
      'ms': '',
    },
    '3rng4eeh': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'moldj4dv': {
      'en': 'Digite o ID do sistema externo',
      'id': '',
      'ms': '',
    },
    '0lukxzjz': {
      'en': 'Excluir',
      'id': '',
      'ms': '',
    },
    'm9vtw9uu': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'q3yrlv56': {
      'en': 'Digite o nome fantasia',
      'id': '',
      'ms': '',
    },
    'xvc09u8z': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '47k3pj2k': {
      'en': 'Digite a razão social',
      'id': '',
      'ms': '',
    },
    '5wd1b052': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '70ma9ztx': {
      'en': 'Digite o ID do sistema externo',
      'id': '',
      'ms': '',
    },
    'u24ai16x': {
      'en': 'Excluir',
      'id': '',
      'ms': '',
    },
    '6e3rkgze': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // p8editarclientes
  {
    'uilbhfvl': {
      'en': 'Editar Clientes',
      'id': '',
      'ms': '',
    },
    'qcwbdn6x': {
      'en': '',
      'id': '',
      'ms': '',
    },
    't1r9t26s': {
      'en': 'Digite o nome fantasia',
      'id': '',
      'ms': '',
    },
    'l84fxkdw': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'd8wbys45': {
      'en': 'Digite a razão social',
      'id': '',
      'ms': '',
    },
    'tzawobgh': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'nfcrth6u': {
      'en': 'Digite o ID do sistema externo',
      'id': '',
      'ms': '',
    },
    'sbj7o7wx': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'e6wgk2tm': {
      'en': 'Digite um e-mail válido',
      'id': '',
      'ms': '',
    },
    'h9dogmry': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'nk0tcuh5': {
      'en': 'Endereço',
      'id': '',
      'ms': '',
    },
    '8zanjhgn': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'gqaohmue': {
      'en': 'Telefone',
      'id': '',
      'ms': '',
    },
    'p1blson3': {
      'en': 'Editar',
      'id': '',
      'ms': '',
    },
    '6jqixnpo': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'r56mzqi9': {
      'en': 'Digite o nome fantasia',
      'id': '',
      'ms': '',
    },
    '2jigfwna': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'r37jnjcv': {
      'en': 'Digite a razão social',
      'id': '',
      'ms': '',
    },
    'riqu23kx': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'fh2ummgd': {
      'en': 'Digite o ID do sistema externo',
      'id': '',
      'ms': '',
    },
    'lelxat10': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '27j0bohc': {
      'en': 'Digite um e-mail válido',
      'id': '',
      'ms': '',
    },
    '6aig104o': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '0rfe1za3': {
      'en': 'Endereço',
      'id': '',
      'ms': '',
    },
    'el5o3x3m': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'q6ylvghq': {
      'en': 'Telefone',
      'id': '',
      'ms': '',
    },
    'tepb3tip': {
      'en': 'Editar',
      'id': '',
      'ms': '',
    },
    'kt20xoim': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // p8criarjornadas
  {
    '9ml8w0d6': {
      'en': 'Criar Jornada',
      'id': '',
      'ms': '',
    },
    'rdfttno3': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'nuixoj6p': {
      'en': 'Digite o ID',
      'id': '',
      'ms': '',
    },
    '75aiwrz3': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'ga9vwi9n': {
      'en': 'ID Externo',
      'id': '',
      'ms': '',
    },
    '47pft651': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'dga2ly8m': {
      'en': 'Descrição da Jornada',
      'id': '',
      'ms': '',
    },
    'uoc91mb3': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'govzi1w1': {
      'en': 'Dias da semana',
      'id': '',
      'ms': '',
    },
    '6ez851yo': {
      'en': 'Criar',
      'id': '',
      'ms': '',
    },
    'kggrbids': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '9mebh90e': {
      'en': 'Digite o ID',
      'id': '',
      'ms': '',
    },
    'y7doj8co': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'aq4j3wne': {
      'en': 'ID Externo',
      'id': '',
      'ms': '',
    },
    '03uclr19': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '1fyvucp3': {
      'en': 'Descrição da Jornada',
      'id': '',
      'ms': '',
    },
    '2ggx0rqm': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'cp8nb424': {
      'en': 'Dias da semana',
      'id': '',
      'ms': '',
    },
    'd27mx153': {
      'en': 'Criar',
      'id': '',
      'ms': '',
    },
    '2bxjkelw': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // p1capa
  {
    '2fgs4w5m': {
      'en': 'Biometria',
      'id': '',
      'ms': '',
    },
    '9my54bm8': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // p8visualplantoes
  {
    'lwr0ff93': {
      'en': 'Plantões',
      'id': '',
      'ms': '',
    },
    '2ur01kwr': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // p8visualjornadas
  {
    '8hy8o9wg': {
      'en': 'Jornadas',
      'id': '',
      'ms': '',
    },
    'mt5icelx': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // p8comprovantedeponto
  {
    '3h6agsok': {
      'en': 'ID',
      'id': '',
      'ms': '',
    },
    'fjaj8fz4': {
      'en': 'Nome',
      'id': '',
      'ms': '',
    },
    'yem5alp1': {
      'en': 'High Profile',
      'id': '',
      'ms': '',
    },
    '2l9cykqj': {
      'en': 'Comprovante de Ponto',
      'id': '',
      'ms': '',
    },
    'h8uz2ear': {
      'en': 'Informações',
      'id': '',
      'ms': '',
    },
    'wdipet2p': {
      'en': 'Hello World',
      'id': '',
      'ms': '',
    },
    'k1rk5kx4': {
      'en': 'Hello World',
      'id': '',
      'ms': '',
    },
    'rx8fxdn9': {
      'en': 'Hello World',
      'id': '',
      'ms': '',
    },
    'vodfvwfx': {
      'en': 'Hello World',
      'id': '',
      'ms': '',
    },
    'yg82g873': {
      'en': 'Hello World',
      'id': '',
      'ms': '',
    },
    '73n1rf2d': {
      'en': 'Hello World',
      'id': '',
      'ms': '',
    },
    'jv7rx2lw': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // p8centraldecargos
  {
    'aoc9jyxy': {
      'en': 'Cargos',
      'id': '',
      'ms': '',
    },
    'x4u8gczb': {
      'en': 'Criar ',
      'id': '',
      'ms': '',
    },
    'stsbqaba': {
      'en': 'Editar',
      'id': '',
      'ms': '',
    },
    '5brs2idq': {
      'en': 'Excluir',
      'id': '',
      'ms': '',
    },
    'lln3q684': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // p8centraldeausencias
  {
    'gtzp4hgv': {
      'en': 'Ausências',
      'id': '',
      'ms': '',
    },
    'ogbig59r': {
      'en': 'Criar ',
      'id': '',
      'ms': '',
    },
    'upwll7k6': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // p8centraldeprojetos
  {
    'z51jp681': {
      'en': 'Projetos',
      'id': '',
      'ms': '',
    },
    'zc7k3j2z': {
      'en': 'Criar ',
      'id': '',
      'ms': '',
    },
    'az0063yk': {
      'en': 'Excluir',
      'id': '',
      'ms': '',
    },
    '9r73kv54': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // p8Overviewprojetos
  {
    '4xj2nrj7': {
      'en': 'Projetos',
      'id': '',
      'ms': '',
    },
    'fii1xrew': {
      'en': 'Projetos',
      'id': '',
      'ms': '',
    },
    'cpk7jm4a': {
      'en': 'Dias',
      'id': '',
      'ms': '',
    },
    'rw3uzr2t': {
      'en':
          'Additional Details around this contract and who is working on it in this card!',
      'id': '',
      'ms': '',
    },
    'k4priqly': {
      'en': 'Projetos',
      'id': '',
      'ms': '',
    },
    'noy2d36b': {
      'en': 'Dias',
      'id': '',
      'ms': '',
    },
    'wfd0nkrf': {
      'en':
          'Additional Details around this contract and who is working on it in this card!',
      'id': '',
      'ms': '',
    },
    'uuid8lav': {
      'en': 'Projetos',
      'id': '',
      'ms': '',
    },
    'wuwkchob': {
      'en': 'Dias',
      'id': '',
      'ms': '',
    },
    'qt1ucpjg': {
      'en':
          'Additional Details around this contract and who is working on it in this card!',
      'id': '',
      'ms': '',
    },
    'qwgw6hew': {
      'en': 'Projetos',
      'id': '',
      'ms': '',
    },
    'x0nhq4y4': {
      'en': '\$125,000',
      'id': '',
      'ms': '',
    },
    '6k2tal5n': {
      'en':
          'Additional Details around this contract and who is working on it in this card!',
      'id': '',
      'ms': '',
    },
    'x12ik5i6': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // p8Overviewclientes
  {
    '0mwg74d5': {
      'en': 'Clientes',
      'id': '',
      'ms': '',
    },
    '5qn6ys66': {
      'en': 'Clientes',
      'id': '',
      'ms': '',
    },
    '8h9phr3m': {
      'en': '\$125,000',
      'id': '',
      'ms': '',
    },
    '4d4g3qsq': {
      'en':
          'Additional Details around this client and who is working on it in this card!',
      'id': '',
      'ms': '',
    },
    '9zzw7nis': {
      'en': 'Clientes',
      'id': '',
      'ms': '',
    },
    'qnmd0h16': {
      'en': '\$125,000',
      'id': '',
      'ms': '',
    },
    'hyhpeev8': {
      'en':
          'Additional Details around this client and who is working on it in this card!',
      'id': '',
      'ms': '',
    },
    'k32bguhx': {
      'en': 'Clientes',
      'id': '',
      'ms': '',
    },
    '927d8hxn': {
      'en': '\$125,000',
      'id': '',
      'ms': '',
    },
    '5j7hyk99': {
      'en':
          'Additional Details around this client and who is working on it in this card!',
      'id': '',
      'ms': '',
    },
    '2id0xu88': {
      'en': 'Clientes',
      'id': '',
      'ms': '',
    },
    'l7fzpd33': {
      'en': '\$125,000',
      'id': '',
      'ms': '',
    },
    'nxd0wsjk': {
      'en':
          'Additional Details around this client and who is working on it in this card!',
      'id': '',
      'ms': '',
    },
    'e2kuace1': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // p8clientesinfo
  {
    'xfpcz8q4': {
      'en': 'ID',
      'id': '',
      'ms': '',
    },
    'tgqhxkx1': {
      'en': 'Cliente',
      'id': '',
      'ms': '',
    },
    'ucc8r5t3': {
      'en': 'High Profile',
      'id': '',
      'ms': '',
    },
    'fu018tdv': {
      'en': 'Card Cliente',
      'id': '',
      'ms': '',
    },
    'wrrc9af8': {
      'en': 'Informações',
      'id': '',
      'ms': '',
    },
    'yvgkjdn2': {
      'en': 'Hello World',
      'id': '',
      'ms': '',
    },
    '9wri73qf': {
      'en': 'Timesheet',
      'id': '',
      'ms': '',
    },
    'ud8ze0b7': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // p8colaboradorinfo
  {
    'icw9ith1': {
      'en': 'ID',
      'id': '',
      'ms': '',
    },
    'uv7jwmbx': {
      'en': 'Colaborador',
      'id': '',
      'ms': '',
    },
    'f11gxszd': {
      'en': 'High Profile',
      'id': '',
      'ms': '',
    },
    '33bs88sa': {
      'en': 'Card colaborador',
      'id': '',
      'ms': '',
    },
    '2oqqdow7': {
      'en': 'Informações',
      'id': '',
      'ms': '',
    },
    'gv1t0opd': {
      'en': 'Hello World',
      'id': '',
      'ms': '',
    },
    '0lxkjw8y': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // p8Oveviercolaboradores
  {
    'uop8lpgi': {
      'en': 'Colaboradores',
      'id': '',
      'ms': '',
    },
    '0cmwt0p6': {
      'en': 'Nome',
      'id': '',
      'ms': '',
    },
    'zgnf7s1t': {
      'en':
          'Additional Details around this person and who is working on it in this card!',
      'id': '',
      'ms': '',
    },
    'm00ediwy': {
      'en': 'Nome',
      'id': '',
      'ms': '',
    },
    'uw2hkn02': {
      'en':
          'Additional Details around this person and who is working on it in this card!',
      'id': '',
      'ms': '',
    },
    '7yo30kgo': {
      'en': 'Nome',
      'id': '',
      'ms': '',
    },
    'n77auqot': {
      'en':
          'Additional Details around this person and who is working on it in this card!',
      'id': '',
      'ms': '',
    },
    'iv6ui30p': {
      'en': 'Nome',
      'id': '',
      'ms': '',
    },
    'm5rgbq62': {
      'en':
          'Additional Details around this person and who is working on it in this card!',
      'id': '',
      'ms': '',
    },
    '1a9f7v4g': {
      'en': 'Nome',
      'id': '',
      'ms': '',
    },
    '6d7txlzp': {
      'en':
          'Additional Details around this person and who is working on it in this card!',
      'id': '',
      'ms': '',
    },
    'ykg8eu6w': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // p8centraldecolaboradores
  {
    '73i14p9p': {
      'en': 'Colaboradores',
      'id': '',
      'ms': '',
    },
    'dhc9r0xq': {
      'en': 'Criar ',
      'id': '',
      'ms': '',
    },
    '27p3exbo': {
      'en': 'Editar',
      'id': '',
      'ms': '',
    },
    'tt97w5xg': {
      'en': 'Excluir',
      'id': '',
      'ms': '',
    },
    'yfkhpkiw': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // p8centraldeclientes
  {
    'hkcsefxn': {
      'en': 'Clientes',
      'id': '',
      'ms': '',
    },
    'vpjq1oa7': {
      'en': 'Criar ',
      'id': '',
      'ms': '',
    },
    'grttk55f': {
      'en': 'Editar',
      'id': '',
      'ms': '',
    },
    'kujwfpns': {
      'en': 'Excluir',
      'id': '',
      'ms': '',
    },
    'u27t4r9o': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // p5menugerencia
  {
    'jd26wb7y': {
      'en': 'Menu',
      'id': '',
      'ms': '',
    },
    'ylchznds': {
      'en': 'Online',
      'id': '',
      'ms': '',
    },
    'wdaxlffq': {
      'en': '24',
      'id': '',
      'ms': '',
    },
    'b128nu0h': {
      'en': 'Ausentes',
      'id': '',
      'ms': '',
    },
    'q8iayzi2': {
      'en': '24',
      'id': '',
      'ms': '',
    },
    '4x2m2rlu': {
      'en': 'Férias',
      'id': '',
      'ms': '',
    },
    'qpahe05o': {
      'en': '24',
      'id': '',
      'ms': '',
    },
    'bf9nj66d': {
      'en': 'Horas extra',
      'id': '',
      'ms': '',
    },
    '0v5vx5qi': {
      'en': '24',
      'id': '',
      'ms': '',
    },
    'm84ggubm': {
      'en': 'Ponto Eletrônico',
      'id': '',
      'ms': '',
    },
    '44aewarh': {
      'en': 'Solicitações',
      'id': '',
      'ms': '',
    },
    'udahj7wz': {
      'en': 'Central ',
      'id': '',
      'ms': '',
    },
    'eambzju8': {
      'en': 'Projetos',
      'id': '',
      'ms': '',
    },
    '40zsq6u2': {
      'en': 'Informações de projetos',
      'id': '',
      'ms': '',
    },
    '0frkigd5': {
      'en': 'Clientes',
      'id': '',
      'ms': '',
    },
    '1ggym93c': {
      'en': 'Informações de clientes',
      'id': '',
      'ms': '',
    },
    'k5ur5fem': {
      'en': 'Colaboradores',
      'id': '',
      'ms': '',
    },
    'q2zkhaug': {
      'en': 'Informações de clientes',
      'id': '',
      'ms': '',
    },
    '3w6cn459': {
      'en': 'Online',
      'id': '',
      'ms': '',
    },
    'y2uz9hlh': {
      'en': '24',
      'id': '',
      'ms': '',
    },
    'jmuu8r38': {
      'en': 'Ausentes',
      'id': '',
      'ms': '',
    },
    '27rfe039': {
      'en': '24',
      'id': '',
      'ms': '',
    },
    '3m0am78d': {
      'en': 'Férias',
      'id': '',
      'ms': '',
    },
    '7sfucr63': {
      'en': '24',
      'id': '',
      'ms': '',
    },
    'vdtdyued': {
      'en': 'Horas extra',
      'id': '',
      'ms': '',
    },
    'emp0fo42': {
      'en': '24',
      'id': '',
      'ms': '',
    },
    'h7dctuks': {
      'en': 'Ponto Eletrônico',
      'id': '',
      'ms': '',
    },
    'wtlwxkwh': {
      'en': 'Solicitações',
      'id': '',
      'ms': '',
    },
    'kv864jyh': {
      'en': 'Central ',
      'id': '',
      'ms': '',
    },
    'y4a80ob8': {
      'en': 'Projetos',
      'id': '',
      'ms': '',
    },
    'rzc1ydum': {
      'en': 'Informações de projetos',
      'id': '',
      'ms': '',
    },
    'pyb0u5oo': {
      'en': 'Clientes',
      'id': '',
      'ms': '',
    },
    'ubh9epmf': {
      'en': 'Informações de clientes',
      'id': '',
      'ms': '',
    },
    'sfolfwy5': {
      'en': 'Colaboradores',
      'id': '',
      'ms': '',
    },
    'h5f5fu03': {
      'en': 'Informações de clientes',
      'id': '',
      'ms': '',
    },
    '20rqj3yk': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // Timesheet
  {
    '4gk6znlk': {
      'en': 'Timesheet',
      'id': '',
      'ms': '',
    },
    'kv1bsvne': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // p8bancodehoras
  {
    'c5dgpdfp': {
      'en': 'Banco de Horas',
      'id': '',
      'ms': '',
    },
    'v0hnvdjs': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'tjuj134y': {
      'en': 'Pesquisa...',
      'id': '',
      'ms': '',
    },
    'gzpm9ger': {
      'en': 'Horas positivas',
      'id': '',
      'ms': '',
    },
    '9hge2f71': {
      'en': '24:00',
      'id': '',
      'ms': '',
    },
    'etpwrfrq': {
      'en': 'Horas negativas',
      'id': '',
      'ms': '',
    },
    'gtd9qzcs': {
      'en': '24:00',
      'id': '',
      'ms': '',
    },
    'fgd5va52': {
      'en': 'Saldo',
      'id': '',
      'ms': '',
    },
    'y7u8f5o9': {
      'en': '24:00',
      'id': '',
      'ms': '',
    },
    'zc6pruf8': {
      'en': 'Registros',
      'id': '',
      'ms': '',
    },
    'feny8soo': {
      'en': 'Ponto dia 12/08/24 - Hora: 18:55 Hrs',
      'id': '',
      'ms': '',
    },
    '2awfpkwv': {
      'en': 'Registros',
      'id': '',
      'ms': '',
    },
    'v55pjvwr': {
      'en': 'Ponto dia 12/08/24 - Hora: 18:55 Hrs',
      'id': '',
      'ms': '',
    },
    '46zky4qx': {
      'en': 'Registros',
      'id': '',
      'ms': '',
    },
    '7ukxd2zk': {
      'en': 'Ponto dia 12/08/24 - Hora: 18:55 Hrs',
      'id': '',
      'ms': '',
    },
    'do2ye5sn': {
      'en': 'Registros',
      'id': '',
      'ms': '',
    },
    'hzr1lmc4': {
      'en': 'Ponto dia 12/08/24 - Hora: 18:55 Hrs',
      'id': '',
      'ms': '',
    },
    'hf2x3ulx': {
      'en': 'Registros',
      'id': '',
      'ms': '',
    },
    'fz3acq1l': {
      'en': 'Ponto dia 12/08/24 - Hora: 18:55 Hrs',
      'id': '',
      'ms': '',
    },
    'y1213l15': {
      'en': 'Registros',
      'id': '',
      'ms': '',
    },
    'engrlxo3': {
      'en': 'Ponto dia 12/08/24 - Hora: 18:55 Hrs',
      'id': '',
      'ms': '',
    },
    'qcrjxtlo': {
      'en': 'Registros',
      'id': '',
      'ms': '',
    },
    'a0fz01y3': {
      'en': 'Ponto dia 12/08/24 - Hora: 18:55 Hrs',
      'id': '',
      'ms': '',
    },
    'f2vjr2ri': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '05bakqwq': {
      'en': 'Pesquisa...',
      'id': '',
      'ms': '',
    },
    's4mb7zgm': {
      'en': 'Horas positivas',
      'id': '',
      'ms': '',
    },
    'xjt2m9ea': {
      'en': '24:00',
      'id': '',
      'ms': '',
    },
    'l2yx3wgm': {
      'en': 'Horas negativas',
      'id': '',
      'ms': '',
    },
    'mi7vzkzn': {
      'en': '24:00',
      'id': '',
      'ms': '',
    },
    'thipw41b': {
      'en': 'Saldo',
      'id': '',
      'ms': '',
    },
    'c81y4jsf': {
      'en': '24:00',
      'id': '',
      'ms': '',
    },
    '5m4twvvo': {
      'en': 'Registros',
      'id': '',
      'ms': '',
    },
    'dyoty1tw': {
      'en': 'Ponto dia 12/08/24 - Hora: 18:55 Hrs',
      'id': '',
      'ms': '',
    },
    '3ctr5apw': {
      'en': 'Registros',
      'id': '',
      'ms': '',
    },
    'exghml3d': {
      'en': 'Ponto dia 12/08/24 - Hora: 18:55 Hrs',
      'id': '',
      'ms': '',
    },
    '64wu7d3a': {
      'en': 'Registros',
      'id': '',
      'ms': '',
    },
    'xchvdbcb': {
      'en': 'Ponto dia 12/08/24 - Hora: 18:55 Hrs',
      'id': '',
      'ms': '',
    },
    'jahfyse1': {
      'en': 'Registros',
      'id': '',
      'ms': '',
    },
    '99vc6drf': {
      'en': 'Ponto dia 12/08/24 - Hora: 18:55 Hrs',
      'id': '',
      'ms': '',
    },
    'imp2xm4j': {
      'en': 'Registros',
      'id': '',
      'ms': '',
    },
    '4stcg2k8': {
      'en': 'Ponto dia 12/08/24 - Hora: 18:55 Hrs',
      'id': '',
      'ms': '',
    },
    'p0gzqzvw': {
      'en': 'Registros',
      'id': '',
      'ms': '',
    },
    'nv9c1onc': {
      'en': 'Ponto dia 12/08/24 - Hora: 18:55 Hrs',
      'id': '',
      'ms': '',
    },
    'bn6zjv5p': {
      'en': 'Registros',
      'id': '',
      'ms': '',
    },
    '4tlz7b48': {
      'en': 'Ponto dia 12/08/24 - Hora: 18:55 Hrs',
      'id': '',
      'ms': '',
    },
    '7gy372ph': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // p8Saldocolaboradores
  {
    '1tqgjgb2': {
      'en': 'Saldo',
      'id': '',
      'ms': '',
    },
    'u10rg23r': {
      'en': '',
      'id': '',
      'ms': '',
    },
    's1pyti9u': {
      'en': 'Pesquisa...',
      'id': '',
      'ms': '',
    },
    '0e5aj797': {
      'en': 'Saldo',
      'id': '',
      'ms': '',
    },
    'r9ydcl04': {
      'en': '24:00hrs',
      'id': '',
      'ms': '',
    },
    'e18xyv1x': {
      'en': 'Ferias',
      'id': '',
      'ms': '',
    },
    '99wkmu69': {
      'en': '2 Dias',
      'id': '',
      'ms': '',
    },
    'xqjg92aj': {
      'en': 'Ausências',
      'id': '',
      'ms': '',
    },
    'vpwebcun': {
      'en': '2 Dias',
      'id': '',
      'ms': '',
    },
    '4h2x9971': {
      'en': 'Extras',
      'id': '',
      'ms': '',
    },
    '8hjw13id': {
      'en': '2 Dias',
      'id': '',
      'ms': '',
    },
    '9vndemal': {
      'en': 'O que deseja fazer com esse saldo?',
      'id': '',
      'ms': '',
    },
    '6xxrdcls': {
      'en': 'Solicitar venda',
      'id': '',
      'ms': '',
    },
    'h9f7rv25': {
      'en': 'Solicitar dispensa',
      'id': '',
      'ms': '',
    },
    'cs6a936i': {
      'en': 'Solicitar hora extra',
      'id': '',
      'ms': '',
    },
    'd1p64puj': {
      'en': 'Relatórios',
      'id': '',
      'ms': '',
    },
    '76hgaak6': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'xrx7g86t': {
      'en': 'Pesquisa...',
      'id': '',
      'ms': '',
    },
    '1dn433ki': {
      'en': 'Saldo',
      'id': '',
      'ms': '',
    },
    'lem5i01i': {
      'en': '24:00hrs',
      'id': '',
      'ms': '',
    },
    '5wnmz5kh': {
      'en': 'Ferias',
      'id': '',
      'ms': '',
    },
    'uatk0wvd': {
      'en': '2 Dias',
      'id': '',
      'ms': '',
    },
    '4h2yfwzf': {
      'en': 'Ausências',
      'id': '',
      'ms': '',
    },
    'e9nlux84': {
      'en': '2 Dias',
      'id': '',
      'ms': '',
    },
    'fceh9law': {
      'en': 'Extras',
      'id': '',
      'ms': '',
    },
    '14jk980i': {
      'en': '2 Dias',
      'id': '',
      'ms': '',
    },
    'cmfs6d8e': {
      'en': 'O que deseja fazer com esse saldo?',
      'id': '',
      'ms': '',
    },
    's3uhsnq7': {
      'en': 'Solicitar venda',
      'id': '',
      'ms': '',
    },
    'kdypb85x': {
      'en': 'Solicitar dispensa',
      'id': '',
      'ms': '',
    },
    'auilz064': {
      'en': 'Solicitar hora extra',
      'id': '',
      'ms': '',
    },
    '07w09xih': {
      'en': 'Relatórios',
      'id': '',
      'ms': '',
    },
    'mh4hxaj0': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // menuPrincipal
  {
    '7t4j6jyp': {
      'en': '#Gestão de Clientes ',
      'id': '',
      'ms': '',
    },
    'q8lj2lxh': {
      'en': 'Cadastrar Contas',
      'id': '',
      'ms': '',
    },
    'vol9qa1s': {
      'en': '#Gestao de funcionarios',
      'id': '',
      'ms': '',
    },
    'pbrca2xa': {
      'en': '#Gestão de Cargos',
      'id': '',
      'ms': '',
    },
    'jvqwncha': {
      'en': '#Gestão de Jornadas',
      'id': '',
      'ms': '',
    },
    'wanzpqs4': {
      'en': 'Lançamentos',
      'id': '',
      'ms': '',
    },
    '56piecxr': {
      'en': 'Relatorios',
      'id': '',
      'ms': '',
    },
    'ueou9h8y': {
      'en': 'Biometria Facial',
      'id': '',
      'ms': '',
    },
    'knx911bw': {
      'en': 'Dispositivos',
      'id': '',
      'ms': '',
    },
    'mnrj5s8y': {
      'en': 'Registrar Ponto',
      'id': '',
      'ms': '',
    },
    't4shmbq1': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // menuPrincipall
  {
    '99twu0ku': {
      'en': 'Gestão de Clientes ',
      'id': '',
      'ms': '',
    },
    'yk9abe4y': {
      'en': 'Gestao de funcionarios',
      'id': '',
      'ms': '',
    },
    'tf3e8917': {
      'en': 'Gestão de Cargos',
      'id': '',
      'ms': '',
    },
    'h73ob8op': {
      'en': 'Gestão de Jornadas',
      'id': '',
      'ms': '',
    },
    'tnsjc1n2': {
      'en': 'Lançamentos',
      'id': '',
      'ms': '',
    },
    'y4px2ukj': {
      'en': 'Relatorios',
      'id': '',
      'ms': '',
    },
    'f7fvmlb7': {
      'en': 'Projetos',
      'id': '',
      'ms': '',
    },
    'zoqz15ct': {
      'en': 'Editar Perfil',
      'id': '',
      'ms': '',
    },
    'ska1hz3b': {
      'en': 'Registrar Ponto',
      'id': '',
      'ms': '',
    },
    'hig3ov2l': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // p8centraldesolicitacoes
  {
    'f0fmbise': {
      'en': 'Solicitações',
      'id': '',
      'ms': '',
    },
    'o4au6klr': {
      'en': 'Solicitações',
      'id': '',
      'ms': '',
    },
    'qlvla6dz': {
      'en': 'Hello World',
      'id': '',
      'ms': '',
    },
    'g1s9para': {
      'en': 'Aprovadas',
      'id': '',
      'ms': '',
    },
    '8afp22ra': {
      'en': 'Hello World',
      'id': '',
      'ms': '',
    },
    'wmoht1lb': {
      'en': 'Hello World',
      'id': '',
      'ms': '',
    },
    'v9feaqba': {
      'en': 'Hello World',
      'id': '',
      'ms': '',
    },
    'my5mq8y2': {
      'en': 'Hello World',
      'id': '',
      'ms': '',
    },
    '2yyigzrp': {
      'en': 'Reprovadas',
      'id': '',
      'ms': '',
    },
    'kftgknep': {
      'en': 'Hello World',
      'id': '',
      'ms': '',
    },
    'pvcydm60': {
      'en': 'Hello World',
      'id': '',
      'ms': '',
    },
    'xlxrw373': {
      'en': 'Hello World',
      'id': '',
      'ms': '',
    },
    'm7y1ta1i': {
      'en': 'Hello World',
      'id': '',
      'ms': '',
    },
    't4pab7v8': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // p8Centraldecriacoes
  {
    '8ulel3cg': {
      'en': 'Central',
      'id': '',
      'ms': '',
    },
    'mbrhr703': {
      'en': 'Projetos',
      'id': '',
      'ms': '',
    },
    'j9lwq8zo': {
      'en': 'Clientes',
      'id': '',
      'ms': '',
    },
    'rrzrw3k4': {
      'en': 'Colaboradores',
      'id': '',
      'ms': '',
    },
    'u765yj39': {
      'en': 'Cargos',
      'id': '',
      'ms': '',
    },
    '3q8kejwg': {
      'en': 'Ausências',
      'id': '',
      'ms': '',
    },
    '82zfv5w6': {
      'en': 'Jornadas',
      'id': '',
      'ms': '',
    },
    'eyqmzrlx': {
      'en': 'Plantões',
      'id': '',
      'ms': '',
    },
    'j7y8rcrf': {
      'en': 'Responsabilidades',
      'id': '',
      'ms': '',
    },
    '6hhs4zhn': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // p8centralplantoes
  {
    'rhfp8jsu': {
      'en': 'Plantões',
      'id': '',
      'ms': '',
    },
    '0kcj4slh': {
      'en': 'Criar ',
      'id': '',
      'ms': '',
    },
    '8iqoy0g3': {
      'en': 'Excluir',
      'id': '',
      'ms': '',
    },
    '2l0yc05b': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // p8excluircolaboradores
  {
    'd6ywl3wu': {
      'en': 'Excluir Colaboradores',
      'id': '',
      'ms': '',
    },
    'pjr7nzny': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'zd7f5k25': {
      'en': 'Digite o ID',
      'id': '',
      'ms': '',
    },
    'muyaporr': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'emdrr812': {
      'en': 'Digite o nome',
      'id': '',
      'ms': '',
    },
    '2sjpgnvs': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '3uocevmk': {
      'en': 'Motivo',
      'id': '',
      'ms': '',
    },
    'hg2awpu2': {
      'en': 'Excluir',
      'id': '',
      'ms': '',
    },
    '9ueybrfy': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'j0prpaed': {
      'en': 'Digite o ID',
      'id': '',
      'ms': '',
    },
    'z8xrcam2': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'iwyl8odd': {
      'en': 'Digite o nome',
      'id': '',
      'ms': '',
    },
    '6nkeoqc3': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'n91odejz': {
      'en': 'Motivo',
      'id': '',
      'ms': '',
    },
    'bdlv0cdh': {
      'en': 'Excluir',
      'id': '',
      'ms': '',
    },
    '1s6l2mo2': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // p8excluirprojeto
  {
    'wjpem0cz': {
      'en': 'Excluir Projeto',
      'id': '',
      'ms': '',
    },
    'b71e69ex': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'f0x6gnak': {
      'en': 'Digite o nome do projeto',
      'id': '',
      'ms': '',
    },
    'cyasa7bg': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '6zhtob9d': {
      'en': 'Digite o ID',
      'id': '',
      'ms': '',
    },
    'rm03l51s': {
      'en': 'Excluir',
      'id': '',
      'ms': '',
    },
    '8v163ar1': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'ekqp3p7t': {
      'en': 'Digite o nome do projeto',
      'id': '',
      'ms': '',
    },
    '0zcr52e5': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'bxvsbn2j': {
      'en': 'Digite o ID',
      'id': '',
      'ms': '',
    },
    'gt22vzsf': {
      'en': 'Excluir',
      'id': '',
      'ms': '',
    },
    'vi7ytv0i': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // p8excluirplantao
  {
    'p9ekk9qg': {
      'en': 'Excluir Plantão',
      'id': '',
      'ms': '',
    },
    'qapcfqpe': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'zh5zialr': {
      'en': 'Digite o nome do plantão',
      'id': '',
      'ms': '',
    },
    '0y31jk16': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'mvgxn3s1': {
      'en': 'Digite o ID',
      'id': '',
      'ms': '',
    },
    '69vwj7x1': {
      'en': 'Excluir',
      'id': '',
      'ms': '',
    },
    'uewtl2aq': {
      'en': '',
      'id': '',
      'ms': '',
    },
    't0audrmy': {
      'en': 'Digite o nome do plantão',
      'id': '',
      'ms': '',
    },
    '64ui3319': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '4xre2v9a': {
      'en': 'Digite o ID',
      'id': '',
      'ms': '',
    },
    '1qc63xrv': {
      'en': 'Excluir',
      'id': '',
      'ms': '',
    },
    '8nzor6uv': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // p8excluirjornada
  {
    'bufelcbf': {
      'en': 'Excluir Jornada',
      'id': '',
      'ms': '',
    },
    'o2xrjnks': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '14k1jj0q': {
      'en': 'Digite o nome a Jornada',
      'id': '',
      'ms': '',
    },
    'x80bsso8': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'j6ei6h7o': {
      'en': 'Digite o ID',
      'id': '',
      'ms': '',
    },
    '16kyhhbl': {
      'en': 'Excluir',
      'id': '',
      'ms': '',
    },
    '1lovib67': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'h59glnx4': {
      'en': 'Digite o nome a Jornada',
      'id': '',
      'ms': '',
    },
    '556vn1sx': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'vpyh5cgz': {
      'en': 'Digite o ID',
      'id': '',
      'ms': '',
    },
    'q5nx3whi': {
      'en': 'Excluir',
      'id': '',
      'ms': '',
    },
    'cazqaqk1': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // p8solicitarhoraextra
  {
    '00yr3jkw': {
      'en': 'Solicitar Hora Extra',
      'id': '',
      'ms': '',
    },
    'nv9kmqd9': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '0kcix6ss': {
      'en': 'Digite o ID',
      'id': '',
      'ms': '',
    },
    'oih0tvce': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'a814m8jn': {
      'en': 'Hora inicial',
      'id': '',
      'ms': '',
    },
    'qbz51g6g': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '93ykzc69': {
      'en': 'Hora Final',
      'id': '',
      'ms': '',
    },
    'dyoxk6ad': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '87hdvyvt': {
      'en': 'Digite o ID do autorizante',
      'id': '',
      'ms': '',
    },
    '6zkvs6qt': {
      'en': 'Solicitar',
      'id': '',
      'ms': '',
    },
    '0pof4jxp': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '147s9ywk': {
      'en': 'Digite o ID',
      'id': '',
      'ms': '',
    },
    '8ls9z7tv': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'bjqfu319': {
      'en': 'Hora inicial',
      'id': '',
      'ms': '',
    },
    'pkuj7kcr': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'e4pyftar': {
      'en': 'Hora Final',
      'id': '',
      'ms': '',
    },
    'upyib6k7': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'rf7229b5': {
      'en': 'Digite o ID do autorizante',
      'id': '',
      'ms': '',
    },
    'zletq69d': {
      'en': 'Solicitar',
      'id': '',
      'ms': '',
    },
    'w1pbroy2': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // p8solicitardispensa
  {
    'hj568bf5': {
      'en': 'Solicitar dispensa',
      'id': '',
      'ms': '',
    },
    'v4pfq7f7': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'kgjguece': {
      'en': 'Digite seu ID',
      'id': '',
      'ms': '',
    },
    'zng0pupw': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '47tndnj8': {
      'en': 'Digite o ID do autorizante',
      'id': '',
      'ms': '',
    },
    'lajrxb24': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'iabc11gf': {
      'en': 'Digite o motivo',
      'id': '',
      'ms': '',
    },
    '8w3dsm2q': {
      'en': 'Solicitar',
      'id': '',
      'ms': '',
    },
    '05z8yz3g': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'cv9ylvfe': {
      'en': 'Digite seu ID',
      'id': '',
      'ms': '',
    },
    '4siw9j73': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'g9di8a9h': {
      'en': 'Digite o ID do autorizante',
      'id': '',
      'ms': '',
    },
    'rg4o9lmf': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'wxj6easn': {
      'en': 'Digite o motivo',
      'id': '',
      'ms': '',
    },
    'vhfhfmr2': {
      'en': 'Solicitar',
      'id': '',
      'ms': '',
    },
    '7hbx5yt3': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // p8solicitarvenda
  {
    'vroyngv1': {
      'en': 'Vender Horas',
      'id': '',
      'ms': '',
    },
    'q7wwpy40': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '92gvqw1e': {
      'en': 'Digite o ID',
      'id': '',
      'ms': '',
    },
    '2w83vu0g': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'fe34v8e2': {
      'en': 'Digite quantas horas quer vender',
      'id': '',
      'ms': '',
    },
    'ooxb5f5b': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'bfyoycu6': {
      'en': 'Digite o ID do autorizante',
      'id': '',
      'ms': '',
    },
    'peylvpct': {
      'en': 'Solicitar',
      'id': '',
      'ms': '',
    },
    'fhe3swwz': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'pdo8cizw': {
      'en': 'Digite o ID',
      'id': '',
      'ms': '',
    },
    '8o5iy6o7': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'v9buetmc': {
      'en': 'Digite quantas horas quer vender',
      'id': '',
      'ms': '',
    },
    'g8tjy1ls': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '3yiuwuoo': {
      'en': 'Digite o ID do autorizante',
      'id': '',
      'ms': '',
    },
    'bxa4hnvf': {
      'en': 'Solicitar',
      'id': '',
      'ms': '',
    },
    'opb2ajg0': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // p8Relatorios
  {
    'chzkeu88': {
      'en': 'Relatórios',
      'id': '',
      'ms': '',
    },
    '2z4fi0r0': {
      'en': 'Ausências',
      'id': '',
      'ms': '',
    },
    'dng0ny7k': {
      'en': 'Horas Extras',
      'id': '',
      'ms': '',
    },
    't0coszny': {
      'en': 'Horas Trabalhadas',
      'id': '',
      'ms': '',
    },
    '6v0o7wmg': {
      'en': 'Dispenssas',
      'id': '',
      'ms': '',
    },
    '5hbd72ks': {
      'en': 'Gerar ',
      'id': '',
      'ms': '',
    },
    'npjb787c': {
      'en': 'Ausências',
      'id': '',
      'ms': '',
    },
    'xu2qw6kx': {
      'en': 'Horas Extras',
      'id': '',
      'ms': '',
    },
    '4btfy1v4': {
      'en': 'Horas Trabalhadas',
      'id': '',
      'ms': '',
    },
    'f9djz8u4': {
      'en': 'Dispenssas',
      'id': '',
      'ms': '',
    },
    'czaus60b': {
      'en': 'Gerar ',
      'id': '',
      'ms': '',
    },
    '5gb7u57u': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // p8centralresponsabilidades
  {
    '4w6ields': {
      'en': 'Responsabilidades',
      'id': '',
      'ms': '',
    },
    'wy6j7ctg': {
      'en': 'Criar ',
      'id': '',
      'ms': '',
    },
    'y2n9s5x0': {
      'en': 'Excluir',
      'id': '',
      'ms': '',
    },
    'dzym0epo': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // p8excluirresponsabilidade
  {
    '8b3u4buv': {
      'en': 'Excluir Responsabilidade',
      'id': '',
      'ms': '',
    },
    'zwobqnu9': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'z6wectiq': {
      'en': 'Digite o ID',
      'id': '',
      'ms': '',
    },
    '75uzi4fb': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'k5g04v7j': {
      'en': 'Descrição',
      'id': '',
      'ms': '',
    },
    '900w321b': {
      'en': 'Excluir',
      'id': '',
      'ms': '',
    },
    'agulx891': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'xz1p5xaf': {
      'en': 'Digite o ID',
      'id': '',
      'ms': '',
    },
    'zr846jcv': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'u5pmz4vc': {
      'en': 'Descrição',
      'id': '',
      'ms': '',
    },
    'l5urowy5': {
      'en': 'Excluir',
      'id': '',
      'ms': '',
    },
    'u781c3mp': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // p8projetosinfo
  {
    'bgukwha8': {
      'en': 'ID',
      'id': '',
      'ms': '',
    },
    'y7np9lh4': {
      'en': 'Projeto',
      'id': '',
      'ms': '',
    },
    '80j9t306': {
      'en': 'High Profile',
      'id': '',
      'ms': '',
    },
    'qcajmyvo': {
      'en': 'Colaboradores',
      'id': '',
      'ms': '',
    },
    'vlsuft4i': {
      'en': 'Informações',
      'id': '',
      'ms': '',
    },
    'ytwmv6gl': {
      'en': 'Hello World',
      'id': '',
      'ms': '',
    },
    '1o7xbvzl': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // p8visualrelatoriosponto
  {
    'miecbkfp': {
      'en': 'Pontos',
      'id': '',
      'ms': '',
    },
    '14ny1qb1': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // TEXT2
  {
    'mon7s7c0': {
      'en': '[Nome do Funcionário]',
      'id': '',
      'ms': '',
    },
  },
  // input
  {
    'xj7e5n42': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'kpyez54j': {
      'en': 'Enter your email here...',
      'id': '',
      'ms': '',
    },
  },
  // Miscellaneous
  {
    'nonhgws3': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '0vatm7yf': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '65e2tfs2': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'ddazihx4': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'db03cpjj': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'fdb9078p': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '80ouzj9q': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '6rzhptp9': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'ce8c4ty0': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'jqiz4llr': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '3mlyok7d': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'syoekoyh': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'idmfp1jk': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'kcvqa08x': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'dqrzd6sq': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'dpqtohyf': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'v01vf71s': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'gcv6def1': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'um9es99m': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'o4enbz4j': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '8z4tvfh7': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '2ybzla8x': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'd1wdf5i1': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'hestwdnm': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '2py80kgi': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'p6lsrh2a': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'ne8cclp9': {
      'en': '',
      'id': '',
      'ms': '',
    },
  },
].reduce((a, b) => a..addAll(b));
