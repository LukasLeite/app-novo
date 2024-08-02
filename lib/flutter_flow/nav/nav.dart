import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? const P2loginWidget() : const P1capaWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? const P2loginWidget() : const P1capaWidget(),
          routes: [
            FFRoute(
              name: 'p2login',
              path: 'p2login',
              builder: (context, params) => const P2loginWidget(),
            ),
            FFRoute(
              name: 'p4recsenha',
              path: 'p4recsenha',
              builder: (context, params) => const P4recsenhaWidget(),
            ),
            FFRoute(
              name: 'p6menucolaboradores',
              path: 'p6menucolaboradores',
              builder: (context, params) => const P6menucolaboradoresWidget(),
            ),
            FFRoute(
              name: 'p8editarperfilcolaborador',
              path: 'p8editarperfilcolaborador',
              builder: (context, params) => const P8editarperfilcolaboradorWidget(),
            ),
            FFRoute(
              name: 'projectDetailsHealthAi',
              path: 'projectDetailsHealthAi',
              builder: (context, params) => const ProjectDetailsHealthAiWidget(),
            ),
            FFRoute(
              name: 'p8cadastrarfuncionario',
              path: 'p8cadastrarfuncionario',
              builder: (context, params) => const P8cadastrarfuncionarioWidget(),
            ),
            FFRoute(
              name: 'p8cadastrodeclientes',
              path: 'p8cadastrodeclientes',
              builder: (context, params) => const P8cadastrodeclientesWidget(),
            ),
            FFRoute(
              name: 'p8criarcargos',
              path: 'p8criarcargos',
              builder: (context, params) => const P8criarcargosWidget(),
            ),
            FFRoute(
              name: 'p8excluircargos',
              path: 'p8excluircargos',
              builder: (context, params) => const P8excluircargosWidget(),
            ),
            FFRoute(
              name: 'gestoPonto',
              path: 'gestoPonto',
              builder: (context, params) => const GestoPontoWidget(),
            ),
            FFRoute(
              name: 'teste',
              path: 'Jornadas',
              builder: (context, params) => const TesteWidget(),
            ),
            FFRoute(
              name: 'p3criarconta',
              path: 'p3criarconta',
              builder: (context, params) => const P3criarcontaWidget(),
            ),
            FFRoute(
              name: 'Pontoeletronico',
              path: 'pontoeletronico',
              builder: (context, params) => const PontoeletronicoWidget(),
            ),
            FFRoute(
              name: 'p8centraldejornadas',
              path: 'p8centraldejornadas',
              builder: (context, params) => const P8centraldejornadasWidget(),
            ),
            FFRoute(
              name: 'p8criarplantao',
              path: 'p8criarplantao',
              builder: (context, params) => const P8criarplantaoWidget(),
            ),
            FFRoute(
              name: 'p8criarresponsabilidade',
              path: 'p8criarresponsabilidade',
              builder: (context, params) => const P8criarresponsabilidadeWidget(),
            ),
            FFRoute(
              name: 'p8criarprojeto',
              path: 'p8criarprojeto',
              builder: (context, params) => const P8criarprojetoWidget(),
            ),
            FFRoute(
              name: 'p8registrarausencia',
              path: 'p8registrarausencia',
              builder: (context, params) => const P8registrarausenciaWidget(),
            ),
            FFRoute(
              name: 'p8criarausencia',
              path: 'p8criarausencia',
              builder: (context, params) => const P8criarausenciaWidget(),
            ),
            FFRoute(
              name: 'p8excluirclientes',
              path: 'p8excluirclientes',
              builder: (context, params) => const P8excluirclientesWidget(),
            ),
            FFRoute(
              name: 'p8editarclientes',
              path: 'p8editarclientes',
              builder: (context, params) => const P8editarclientesWidget(),
            ),
            FFRoute(
              name: 'p8criarjornadas',
              path: 'p8criarjornadas',
              builder: (context, params) => const P8criarjornadasWidget(),
            ),
            FFRoute(
              name: 'p1capa',
              path: 'p1capa',
              builder: (context, params) => const P1capaWidget(),
            ),
            FFRoute(
              name: 'p8visualplantoes',
              path: 'p8visualplantoes',
              builder: (context, params) => const P8visualplantoesWidget(),
            ),
            FFRoute(
              name: 'p8visualjornadas',
              path: 'p8visualjornadas',
              builder: (context, params) => const P8visualjornadasWidget(),
            ),
            FFRoute(
              name: 'p8comprovantedeponto',
              path: 'p8comprovantedeponto',
              builder: (context, params) => const P8comprovantedepontoWidget(),
            ),
            FFRoute(
              name: 'p8centraldecargos',
              path: 'p8centraldecargos',
              builder: (context, params) => const P8centraldecargosWidget(),
            ),
            FFRoute(
              name: 'p8centraldeausencias',
              path: 'p8centraldeausencias',
              builder: (context, params) => const P8centraldeausenciasWidget(),
            ),
            FFRoute(
              name: 'p8centraldeprojetos',
              path: 'p8centraldeprojetos',
              builder: (context, params) => const P8centraldeprojetosWidget(),
            ),
            FFRoute(
              name: 'p8Overviewprojetos',
              path: 'p8Overviewprojetos',
              builder: (context, params) => const P8OverviewprojetosWidget(),
            ),
            FFRoute(
              name: 'p8Overviewclientes',
              path: 'p8Overviewclientes',
              builder: (context, params) => const P8OverviewclientesWidget(),
            ),
            FFRoute(
              name: 'p8clientesinfo',
              path: 'p8clientesinfo',
              builder: (context, params) => const P8clientesinfoWidget(),
            ),
            FFRoute(
              name: 'p8colaboradorinfo',
              path: 'p8colaboradorinfo',
              builder: (context, params) => const P8colaboradorinfoWidget(),
            ),
            FFRoute(
              name: 'p8Oveviercolaboradores',
              path: 'p8Oveviercolaboradores',
              builder: (context, params) => const P8OveviercolaboradoresWidget(),
            ),
            FFRoute(
              name: 'p8centraldecolaboradores',
              path: 'p8centraldecolaboradores',
              builder: (context, params) => const P8centraldecolaboradoresWidget(),
            ),
            FFRoute(
              name: 'p8centraldeclientes',
              path: 'p8centraldeclientes',
              builder: (context, params) => const P8centraldeclientesWidget(),
            ),
            FFRoute(
              name: 'p5menugerencia',
              path: 'p5menugerencia',
              builder: (context, params) => const P5menugerenciaWidget(),
            ),
            FFRoute(
              name: 'Timesheet',
              path: 'timesheet',
              builder: (context, params) => const TimesheetWidget(),
            ),
            FFRoute(
              name: 'p8bancodehoras',
              path: 'p8bancodehoras',
              builder: (context, params) => const P8bancodehorasWidget(),
            ),
            FFRoute(
              name: 'p8Saldocolaboradores',
              path: 'p8Saldocolaboradores',
              builder: (context, params) => const P8SaldocolaboradoresWidget(),
            ),
            FFRoute(
              name: 'menuPrincipal',
              path: 'menuPrincipal',
              builder: (context, params) => const MenuPrincipalWidget(),
            ),
            FFRoute(
              name: 'menuPrincipall',
              path: 'menuPrincipalCopy',
              builder: (context, params) => const MenuPrincipallWidget(),
            ),
            FFRoute(
              name: 'p8centraldesolicitacoes',
              path: 'p8centraldesolicitacoes',
              builder: (context, params) => const P8centraldesolicitacoesWidget(),
            ),
            FFRoute(
              name: 'p8Centraldecriacoes',
              path: 'p8Centraldecriacoes',
              builder: (context, params) => const P8CentraldecriacoesWidget(),
            ),
            FFRoute(
              name: 'p8centralplantoes',
              path: 'p8centralplantoes',
              builder: (context, params) => const P8centralplantoesWidget(),
            ),
            FFRoute(
              name: 'p8excluircolaboradores',
              path: 'p8excluircolaboradores',
              builder: (context, params) => const P8excluircolaboradoresWidget(),
            ),
            FFRoute(
              name: 'p8excluirprojeto',
              path: 'p8excluirprojeto',
              builder: (context, params) => const P8excluirprojetoWidget(),
            ),
            FFRoute(
              name: 'p8excluirplantao',
              path: 'p8excluirplantao',
              builder: (context, params) => const P8excluirplantaoWidget(),
            ),
            FFRoute(
              name: 'p8excluirjornada',
              path: 'p8excluirjornada',
              builder: (context, params) => const P8excluirjornadaWidget(),
            ),
            FFRoute(
              name: 'p8solicitarhoraextra',
              path: 'p8solicitarhoraextra',
              builder: (context, params) => const P8solicitarhoraextraWidget(),
            ),
            FFRoute(
              name: 'p8solicitardispensa',
              path: 'p8solicitardispensa',
              builder: (context, params) => const P8solicitardispensaWidget(),
            ),
            FFRoute(
              name: 'p8solicitarvenda',
              path: 'p8solicitarvenda',
              builder: (context, params) => const P8solicitarvendaWidget(),
            ),
            FFRoute(
              name: 'p8Relatorios',
              path: 'p8Relatorios',
              builder: (context, params) => const P8RelatoriosWidget(),
            ),
            FFRoute(
              name: 'p8centralresponsabilidades',
              path: 'p8centralresponsabilidades',
              builder: (context, params) => const P8centralresponsabilidadesWidget(),
            ),
            FFRoute(
              name: 'p8excluirresponsabilidade',
              path: 'p8excluirresponsabilidade',
              builder: (context, params) => const P8excluirresponsabilidadeWidget(),
            ),
            FFRoute(
              name: 'p8projetosinfo',
              path: 'p8projetosinfo',
              builder: (context, params) => const P8projetosinfoWidget(),
            ),
            FFRoute(
              name: 'p8visualrelatoriosponto',
              path: 'p8visualrelatoriosponto',
              builder: (context, params) => const P8visualrelatoriospontoWidget(),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/p1capa';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
