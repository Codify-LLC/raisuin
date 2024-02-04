import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'schedule_interview_model.dart';
export 'schedule_interview_model.dart';

class ScheduleInterviewWidget extends StatefulWidget {
  const ScheduleInterviewWidget({
    super.key,
    required this.candidateId,
    required this.chatDoc,
  });

  final DocumentReference? candidateId;
  final DocumentReference? chatDoc;

  @override
  State<ScheduleInterviewWidget> createState() =>
      _ScheduleInterviewWidgetState();
}

class _ScheduleInterviewWidgetState extends State<ScheduleInterviewWidget> {
  late ScheduleInterviewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScheduleInterviewModel());

    _model.userRoleController ??= TextEditingController();
    _model.userRoleFocusNode ??= FocusNode();
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
      constraints: const BoxConstraints(
        maxWidth: 600.0,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: const BorderRadius.only(
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
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 12.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Schedule Interview',
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
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 0.0, 0.0),
            child: Text(
              'Pick Interview Date*',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Sora',
                    fontSize: 14.0,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 16.0, 23.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                final datePickedDate = await showDatePicker(
                  context: context,
                  initialDate: functions.futureDateTime(
                      getCurrentTimestamp, 0, 2, 0, 0, 0),
                  firstDate: (functions.futureDateTime(
                          getCurrentTimestamp, 0, 2, 0, 0, 0) ??
                      DateTime(1900)),
                  lastDate: (functions.futureDateTime(
                          getCurrentTimestamp, 2, 2, 0, 0, 0) ??
                      DateTime(2050)),
                );

                if (datePickedDate != null) {
                  safeSetState(() {
                    _model.datePicked = DateTime(
                      datePickedDate.year,
                      datePickedDate.month,
                      datePickedDate.day,
                    );
                  });
                }
              },
              child: Container(
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).lineColor,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _model.datePicked != null
                            ? '${dateTimeFormat('yMMMd', _model.datePicked)} - ${dateTimeFormat('jm', _model.datePicked)}'
                            : 'Pick a Date',
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                      Icon(
                        Icons.calendar_month,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
            child: Text(
              'Interview Mode*',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Sora',
                    fontSize: 14.0,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 14.0, 0.0, 16.0),
            child: FlutterFlowChoiceChips(
              options: const [
                ChipData('Online'),
                ChipData('Phone'),
                ChipData('Physical')
              ],
              onChanged: (val) =>
                  setState(() => _model.choiceChipsValue = val?.first),
              selectedChipStyle: ChipStyle(
                backgroundColor: FlutterFlowTheme.of(context).primaryText,
                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Sora',
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      fontSize: 13.0,
                    ),
                iconColor: FlutterFlowTheme.of(context).primaryText,
                iconSize: 18.0,
                labelPadding:
                    const EdgeInsetsDirectional.fromSTEB(14.0, 6.0, 14.0, 8.0),
                elevation: 0.0,
              ),
              unselectedChipStyle: ChipStyle(
                backgroundColor: FlutterFlowTheme.of(context).accent4,
                textStyle: FlutterFlowTheme.of(context).bodySmall.override(
                      fontFamily: 'Sora',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 13.0,
                    ),
                iconColor: FlutterFlowTheme.of(context).primaryText,
                iconSize: 18.0,
                labelPadding:
                    const EdgeInsetsDirectional.fromSTEB(14.0, 6.0, 14.0, 8.0),
                elevation: 0.0,
              ),
              chipSpacing: 5.0,
              rowSpacing: 17.0,
              multiselect: false,
              initialized: _model.choiceChipsValue != null,
              alignment: WrapAlignment.start,
              controller: _model.choiceChipsValueController ??=
                  FormFieldController<List<String>>(
                ['Online'],
              ),
              wrapped: true,
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
            child: Text(
              'Message*',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Sora',
                    fontSize: 14.0,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 16.0, 15.0),
            child: TextFormField(
              controller: _model.userRoleController,
              focusNode: _model.userRoleFocusNode,
              obscureText: false,
              decoration: InputDecoration(
                hintText: 'Add your message',
                hintStyle: FlutterFlowTheme.of(context).bodySmall.override(
                      fontFamily: 'Sora',
                      fontSize: 13.0,
                    ),
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
                  borderSide: const BorderSide(
                    color: Color(0x00000000),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0x00000000),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                contentPadding:
                    const EdgeInsetsDirectional.fromSTEB(10.0, 16.0, 10.0, 10.0),
              ),
              style: FlutterFlowTheme.of(context).bodyMedium,
              maxLines: null,
              minLines: 4,
              validator:
                  _model.userRoleControllerValidator.asValidator(context),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
              child: FFButtonWidget(
                onPressed: () async {
                  var interviewsRecordReference =
                      InterviewsRecord.collection.doc();
                  await interviewsRecordReference
                      .set(createInterviewsRecordData(
                    recruiter: currentUserReference,
                    candidate: widget.candidateId,
                    chatRef: widget.chatDoc,
                    interviewDate: _model.datePicked,
                    interviewMode: _model.choiceChipsValue,
                    message: _model.userRoleController.text,
                  ));
                  _model.interviewDoc = InterviewsRecord.getDocumentFromData(
                      createInterviewsRecordData(
                        recruiter: currentUserReference,
                        candidate: widget.candidateId,
                        chatRef: widget.chatDoc,
                        interviewDate: _model.datePicked,
                        interviewMode: _model.choiceChipsValue,
                        message: _model.userRoleController.text,
                      ),
                      interviewsRecordReference);

                  await MessagesRecord.collection
                      .doc()
                      .set(createMessagesRecordData(
                        sentBy: currentUserReference,
                        chat: widget.chatDoc,
                        interview: _model.interviewDoc?.reference,
                        sentOn: getCurrentTimestamp,
                      ));
                  Navigator.pop(context);

                  setState(() {});
                },
                text: 'Schedule Interview',
                options: FFButtonOptions(
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  height: 50.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).tertiary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Sora',
                        color: Colors.white,
                      ),
                  elevation: 3.0,
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(24.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
