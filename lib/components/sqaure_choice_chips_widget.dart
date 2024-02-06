import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'sqaure_choice_chips_model.dart';
export 'sqaure_choice_chips_model.dart';

class SqaureChoiceChipsWidget extends StatefulWidget {
  const SqaureChoiceChipsWidget({
    super.key,
    required this.value,
    required this.onTap,
    bool? selected,
    required this.image,
  }) : selected = selected ?? false;

  final String? value;
  final Future Function()? onTap;
  final bool selected;
  final String? image;

  @override
  State<SqaureChoiceChipsWidget> createState() =>
      _SqaureChoiceChipsWidgetState();
}

class _SqaureChoiceChipsWidgetState extends State<SqaureChoiceChipsWidget> {
  late SqaureChoiceChipsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SqaureChoiceChipsModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Stack(
      alignment: const AlignmentDirectional(1.0, -1.0),
      children: [
        InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            await widget.onTap?.call();
          },
          child: Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              color: valueOrDefault<Color>(
                widget.selected
                    ? FlutterFlowTheme.of(context).primaryBackground
                    : FlutterFlowTheme.of(context).accent4,
                FlutterFlowTheme.of(context).accent4,
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Hero(
                    tag: widget.image!,
                    transitionOnUserGestures: true,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: CachedNetworkImage(
                        fadeInDuration: const Duration(milliseconds: 500),
                        fadeOutDuration: const Duration(milliseconds: 500),
                        imageUrl: widget.image!,
                        width: 40.0,
                        height: 40.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                AutoSizeText(
                  widget.value!,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Sora',
                        fontSize: 12.0,
                      ),
                ),
              ].divide(const SizedBox(height: 6.0)),
            ),
          ),
        ),
        if (widget.selected)
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Icon(
              Icons.check_circle,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 18.0,
            ),
          ),
      ],
    );
  }
}
