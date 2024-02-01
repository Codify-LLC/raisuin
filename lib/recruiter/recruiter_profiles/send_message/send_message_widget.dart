import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'send_message_model.dart';
export 'send_message_model.dart';

class SendMessageWidget extends StatefulWidget {
  const SendMessageWidget({
    super.key,
    required this.candidateList,
  });

  final List<DocumentReference>? candidateList;

  @override
  State<SendMessageWidget> createState() => _SendMessageWidgetState();
}

class _SendMessageWidgetState extends State<SendMessageWidget> {
  late SendMessageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SendMessageModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        maxWidth: 600.0,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 12.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Send Bulk Message',
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.clear,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24.0,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 1.0,
            thickness: 1.0,
            color: FlutterFlowTheme.of(context).accent3,
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Chat Message',
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: TextFormField(
                    controller: _model.textController,
                    focusNode: _model.textFieldFocusNode,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'Chat  Message........',
                      hintStyle: FlutterFlowTheme.of(context).bodySmall,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).accent3,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).accent3,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                    maxLines: 5,
                    validator:
                        _model.textControllerValidator.asValidator(context),
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Divider(
                height: 1.0,
                thickness: 1.0,
                color: FlutterFlowTheme.of(context).accent3,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 14.0, 0.0, 30.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            while (_model.loop < widget.candidateList!.length) {
                              _model.alldocs = await queryChatsRecordOnce(
                                queryBuilder: (chatsRecord) =>
                                    chatsRecord.where(
                                  'users',
                                  arrayContains: getChatUserFirestoreData(
                                    ChatUserStruct(
                                      userRef: currentUserReference,
                                      userName: currentUserDisplayName,
                                      userEmail: currentUserEmail,
                                    ),
                                    true,
                                  ),
                                ),
                              );
                              if (!(_model.alldocs!
                                  .where((e) => e.users
                                      .where((e) =>
                                          e.userRef ==
                                          (widget.candidateList?[_model.loop]))
                                      .toList()
                                      .isNotEmpty)
                                  .toList()
                                  .isNotEmpty)) {
                                var chatsRecordReference =
                                    ChatsRecord.collection.doc();
                                await chatsRecordReference.set({
                                  ...mapToFirestore(
                                    {
                                      'users': [
                                        getChatUserFirestoreData(
                                          createChatUserStruct(
                                            userRef: currentUserReference,
                                            userName: currentUserDisplayName,
                                            userEmail: currentUserEmail,
                                            clearUnsetFields: false,
                                            create: true,
                                          ),
                                          true,
                                        )
                                      ],
                                    },
                                  ),
                                });
                                _model.createdChat =
                                    ChatsRecord.getDocumentFromData({
                                  ...mapToFirestore(
                                    {
                                      'users': [
                                        getChatUserFirestoreData(
                                          createChatUserStruct(
                                            userRef: currentUserReference,
                                            userName: currentUserDisplayName,
                                            userEmail: currentUserEmail,
                                            clearUnsetFields: false,
                                            create: true,
                                          ),
                                          true,
                                        )
                                      ],
                                    },
                                  ),
                                }, chatsRecordReference);
                                _model.userDoc =
                                    await UsersRecord.getDocumentOnce(
                                        widget.candidateList![_model.loop]);

                                await _model.createdChat!.reference.update({
                                  ...mapToFirestore(
                                    {
                                      'users': FieldValue.arrayUnion([
                                        getChatUserFirestoreData(
                                          updateChatUserStruct(
                                            ChatUserStruct(
                                              userRef:
                                                  _model.userDoc?.reference,
                                              userName:
                                                  _model.userDoc?.displayName,
                                              userEmail: _model.userDoc?.email,
                                            ),
                                            clearUnsetFields: false,
                                          ),
                                          true,
                                        )
                                      ]),
                                    },
                                  ),
                                });

                                await MessagesRecord.collection
                                    .doc()
                                    .set(createMessagesRecordData(
                                      sentBy: currentUserReference,
                                      chat: _model.createdChat?.reference,
                                      textMessage: _model.textController.text,
                                      sentOn: getCurrentTimestamp,
                                    ));
                              } else {
                                await MessagesRecord.collection
                                    .doc()
                                    .set(createMessagesRecordData(
                                      sentBy: currentUserReference,
                                      chat: _model.alldocs
                                          ?.where((e) => e.users
                                              .where((e) =>
                                                  e.userRef ==
                                                  (widget.candidateList?[
                                                      _model.loop]))
                                              .toList()
                                              .isNotEmpty)
                                          .toList()
                                          ?.first
                                          ?.reference,
                                      textMessage: _model.textController.text,
                                      sentOn: getCurrentTimestamp,
                                    ));
                              }

                              _model.updatePage(() {
                                _model.loop = _model.loop + 1;
                              });
                            }

                            context.pushNamed('chat');

                            setState(() {});
                          },
                          text: 'Send Message',
                          options: FFButtonOptions(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 50.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).tertiary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Sora',
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
