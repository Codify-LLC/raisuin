import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'navigation_model.dart';
export 'navigation_model.dart';

class NavigationWidget extends StatefulWidget {
  const NavigationWidget({
    super.key,
    bool? home,
    bool? search,
    bool? ads,
    bool? messages,
    bool? accounts,
  })  : home = home ?? false,
        search = search ?? false,
        ads = ads ?? false,
        messages = messages ?? false,
        accounts = accounts ?? false;

  final bool home;
  final bool search;
  final bool ads;
  final bool messages;
  final bool accounts;

  @override
  State<NavigationWidget> createState() => _NavigationWidgetState();
}

class _NavigationWidgetState extends State<NavigationWidget> {
  late NavigationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavigationModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: 70.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Divider(
            height: 2.0,
            thickness: 1.0,
            color: FlutterFlowTheme.of(context).accent3,
          ),
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlutterFlowIconButton(
                  borderRadius: 10.0,
                  borderWidth: 1.0,
                  buttonSize: 40.0,
                  fillColor: widget.home
                      ? FlutterFlowTheme.of(context).tertiary
                      : const Color(0x00000000),
                  icon: Icon(
                    Icons.home,
                    color: widget.home
                        ? FlutterFlowTheme.of(context).primaryBackground
                        : FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    context.pushNamed('homePage');
                  },
                ),
                FlutterFlowIconButton(
                  borderRadius: 10.0,
                  buttonSize: 40.0,
                  fillColor: widget.search
                      ? FlutterFlowTheme.of(context).tertiary
                      : const Color(0x00000000),
                  icon: Icon(
                    Icons.search,
                    color: widget.search
                        ? FlutterFlowTheme.of(context).primaryBackground
                        : FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    context.pushNamed('listCandidates');
                  },
                ),
                FlutterFlowIconButton(
                  borderRadius: 10.0,
                  borderWidth: 1.0,
                  buttonSize: 40.0,
                  fillColor: widget.ads
                      ? FlutterFlowTheme.of(context).tertiary
                      : const Color(0x00000000),
                  icon: Icon(
                    Icons.add_rounded,
                    color: widget.ads
                        ? FlutterFlowTheme.of(context).primaryBackground
                        : FlutterFlowTheme.of(context).secondaryText,
                    size: 22.0,
                  ),
                  onPressed: () async {
                    context.pushNamed('createAd');
                  },
                ),
                FlutterFlowIconButton(
                  borderRadius: 10.0,
                  borderWidth: 1.0,
                  buttonSize: 40.0,
                  fillColor: widget.messages
                      ? FlutterFlowTheme.of(context).tertiary
                      : const Color(0x00000000),
                  icon: Icon(
                    Icons.message_outlined,
                    color: widget.messages
                        ? FlutterFlowTheme.of(context).primaryBackground
                        : FlutterFlowTheme.of(context).secondaryText,
                    size: 20.0,
                  ),
                  onPressed: () async {
                    context.pushNamed('chat');
                  },
                ),
                FlutterFlowIconButton(
                  borderRadius: 10.0,
                  borderWidth: 1.0,
                  buttonSize: 40.0,
                  fillColor: widget.accounts
                      ? FlutterFlowTheme.of(context).tertiary
                      : const Color(0x00000000),
                  icon: Icon(
                    Icons.account_circle,
                    color: widget.accounts
                        ? FlutterFlowTheme.of(context).primaryBackground
                        : FlutterFlowTheme.of(context).secondaryText,
                    size: 20.0,
                  ),
                  onPressed: () async {
                    context.pushNamed('profileEmployer');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
