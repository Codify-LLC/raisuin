import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/sqaure_choice_chips_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'filter_model.dart';
export 'filter_model.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({super.key});

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  late FilterModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FilterModel());

    _model.salaryminController ??= TextEditingController();
    _model.salaryminFocusNode ??= FocusNode();

    _model.salarytillController ??= TextEditingController();
    _model.salarytillFocusNode ??= FocusNode();

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

    return StreamBuilder<List<GeneralSettingsConfigRecord>>(
      stream: queryGeneralSettingsConfigRecord(
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  FlutterFlowTheme.of(context).primary,
                ),
              ),
            ),
          );
        }
        List<GeneralSettingsConfigRecord>
            containerGeneralSettingsConfigRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final containerGeneralSettingsConfigRecord =
            containerGeneralSettingsConfigRecordList.isNotEmpty
                ? containerGeneralSettingsConfigRecordList.first
                : null;
        return Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: MediaQuery.sizeOf(context).height * 1.0,
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
                      'Filters',
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
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            21.0, 0.0, 25.0, 10.0),
                        child: Text(
                          ' Job Type',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Sora',
                                    fontSize: 14.0,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            21.0, 0.0, 25.0, 0.0),
                        child: FlutterFlowChoiceChips(
                          options: const [
                            ChipData('Full Time'),
                            ChipData('Part Time'),
                            ChipData('Freelance')
                          ],
                          onChanged: (val) async {
                            setState(
                                () => _model.choiceChipsValue = val?.first);
                            setState(() {
                              _model.jobtype = true;
                            });
                          },
                          selectedChipStyle: ChipStyle(
                            backgroundColor:
                                FlutterFlowTheme.of(context).primaryText,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Sora',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  fontSize: 13.0,
                                ),
                            iconColor: FlutterFlowTheme.of(context).primaryText,
                            iconSize: 18.0,
                            labelPadding: const EdgeInsetsDirectional.fromSTEB(
                                14.0, 6.0, 14.0, 8.0),
                            elevation: 0.0,
                          ),
                          unselectedChipStyle: ChipStyle(
                            backgroundColor:
                                FlutterFlowTheme.of(context).accent4,
                            textStyle:
                                FlutterFlowTheme.of(context).bodySmall.override(
                                      fontFamily: 'Sora',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 13.0,
                                    ),
                            iconColor: FlutterFlowTheme.of(context).primaryText,
                            iconSize: 18.0,
                            labelPadding: const EdgeInsetsDirectional.fromSTEB(
                                14.0, 6.0, 14.0, 8.0),
                            elevation: 0.0,
                          ),
                          chipSpacing: 5.0,
                          rowSpacing: 17.0,
                          multiselect: false,
                          alignment: WrapAlignment.start,
                          controller: _model.choiceChipsValueController ??=
                              FormFieldController<List<String>>(
                            [],
                          ),
                          wrapped: true,
                        ),
                      ),
                      if (false)
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              21.0, 23.0, 25.0, 10.0),
                          child: Text(
                            'Gender',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Sora',
                                  fontSize: 14.0,
                                ),
                          ),
                        ),
                      if (false)
                        Builder(
                          builder: (context) {
                            final genderValue =
                                Gender.values.toList().take(3).toList();
                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: List.generate(genderValue.length,
                                        (genderValueIndex) {
                                  final genderValueItem =
                                      genderValue[genderValueIndex];
                                  return SqaureChoiceChipsWidget(
                                    key: Key(
                                        'Keyar5_${genderValueIndex}_of_${genderValue.length}'),
                                    value: genderValueItem.name,
                                    selected: _model.gender
                                        .where((e) => e == genderValueItem)
                                        .toList()
                                        .isNotEmpty,
                                    image: () {
                                      if (genderValueItem == Gender.Male) {
                                        return 'https://static.wixstatic.com/media/83945f_add54d39dbb54951b840c1c9435d97f7~mv2.png/v1/fill/w_95,h_94,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/homem.png';
                                      } else if (genderValueItem ==
                                          Gender.Female) {
                                        return 'https://esg.wharton.upenn.edu/wp-content/uploads/2023/03/wharton-women-icon-5.png';
                                      } else {
                                        return 'https://nrd.irsn.fr/sites/nrd/files/styles/default/public/2023-12/adultes-radiologie-conventionnelle.png?itok=d36HEsc7';
                                      }
                                    }(),
                                    onTap: () async {
                                      if (_model.gender
                                          .where((e) => e == genderValueItem)
                                          .toList()
                                          .isNotEmpty) {
                                        setState(() {
                                          _model.removeFromGender(
                                              genderValueItem);
                                        });
                                      } else {
                                        setState(() {
                                          _model.addToGender(genderValueItem);
                                        });
                                      }
                                    },
                                  );
                                })
                                    .divide(const SizedBox(width: 10.0))
                                    .addToStart(const SizedBox(width: 21.0))
                                    .addToEnd(const SizedBox(width: 25.0)),
                              ),
                            );
                          },
                        ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            21.0, 23.0, 25.0, 10.0),
                        child: Text(
                          'Education',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Sora',
                                    fontSize: 14.0,
                                  ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            flex: 2,
                            child: FlutterFlowDropDown<String>(
                              controller: _model.levelValueController ??=
                                  FormFieldController<String>(null),
                              options: functions.allTypesOfDegreeLevels(),
                              onChanged: (val) =>
                                  setState(() => _model.levelValue = val),
                              width: 300.0,
                              height: 48.0,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Sora',
                                    fontSize: 14.0,
                                  ),
                              hintText: 'Level',
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 16.0,
                              ),
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 2.0,
                              borderColor: FlutterFlowTheme.of(context).accent3,
                              borderWidth: 0.0,
                              borderRadius: 10.0,
                              margin: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 4.0, 16.0, 4.0),
                              hidesUnderline: true,
                              isSearchable: false,
                              isMultiSelect: false,
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: FlutterFlowDropDown<String>(
                              controller: _model.degreeValueController ??=
                                  FormFieldController<String>(null),
                              options: containerGeneralSettingsConfigRecord!
                                  .degreeList,
                              onChanged: (val) =>
                                  setState(() => _model.degreeValue = val),
                              width: 300.0,
                              height: 48.0,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Sora',
                                    fontSize: 14.0,
                                  ),
                              hintText: 'Degree',
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 16.0,
                              ),
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 2.0,
                              borderColor: FlutterFlowTheme.of(context).accent3,
                              borderWidth: 0.0,
                              borderRadius: 10.0,
                              margin: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 4.0, 16.0, 4.0),
                              hidesUnderline: true,
                              isSearchable: false,
                              isMultiSelect: false,
                            ),
                          ),
                        ]
                            .divide(const SizedBox(width: 10.0))
                            .addToStart(const SizedBox(width: 21.0))
                            .addToEnd(const SizedBox(width: 25.0)),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            21.0, 23.0, 25.0, 10.0),
                        child: Text(
                          'Subjects',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Sora',
                                    fontSize: 14.0,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            21.0, 0.0, 25.0, 0.0),
                        child: FlutterFlowDropDown<String>(
                          controller: _model.subjectValueController ??=
                              FormFieldController<String>(null),
                          options:
                              containerGeneralSettingsConfigRecord.subjects,
                          onChanged: (val) =>
                              setState(() => _model.subjectValue = val),
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 50.0,
                          searchHintTextStyle:
                              FlutterFlowTheme.of(context).labelMedium,
                          searchTextStyle:
                              FlutterFlowTheme.of(context).bodyMedium,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Sora',
                                    fontSize: 14.0,
                                  ),
                          hintText: 'Select subjects',
                          searchHintText: 'Search for an item...',
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 16.0,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 2.0,
                          borderColor: FlutterFlowTheme.of(context).accent3,
                          borderWidth: 0.0,
                          borderRadius: 10.0,
                          margin: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 4.0, 16.0, 4.0),
                          hidesUnderline: true,
                          isSearchable: true,
                          isMultiSelect: false,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            21.0, 23.0, 25.0, 10.0),
                        child: Text(
                          'Location',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Sora',
                                    fontSize: 14.0,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            21.0, 0.0, 25.0, 0.0),
                        child: FlutterFlowPlacePicker(
                          iOSGoogleMapsApiKey:
                              'AIzaSyDAPoNGbEG7CGHzQ74mkrjnixn1XR4scFQ',
                          androidGoogleMapsApiKey:
                              'AIzaSyDAPoNGbEG7CGHzQ74mkrjnixn1XR4scFQ',
                          webGoogleMapsApiKey:
                              'AIzaSyDAPoNGbEG7CGHzQ74mkrjnixn1XR4scFQ',
                          onSelect: (place) async {
                            setState(() => _model.placePickerValue = place);
                          },
                          defaultText: 'Select Location',
                          icon: Icon(
                            Icons.place,
                            color: FlutterFlowTheme.of(context).info,
                            size: 16.0,
                          ),
                          buttonOptions: FFButtonOptions(
                            width: 200.0,
                            height: 40.0,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Sora',
                                  color: FlutterFlowTheme.of(context).info,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).accent3,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            21.0, 23.0, 25.0, 10.0),
                        child: Text(
                          'Age',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Sora',
                                    fontSize: 14.0,
                                  ),
                        ),
                      ),
                      Slider(
                        activeColor: FlutterFlowTheme.of(context).tertiary,
                        inactiveColor: FlutterFlowTheme.of(context).accent3,
                        min: 18.0,
                        max: 60.0,
                        value: _model.ageValue ??= 18.0,
                        label: _model.ageValue.toString(),
                        divisions: 42,
                        onChanged: (newValue) {
                          setState(() => _model.ageValue = newValue);
                        },
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            21.0, 23.0, 25.0, 10.0),
                        child: Text(
                          'Available For',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Sora',
                                    fontSize: 14.0,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            21.0, 0.0, 25.0, 0.0),
                        child: FlutterFlowChoiceChips(
                          options: const [
                            ChipData('School'),
                            ChipData('College'),
                            ChipData('ITI'),
                            ChipData('Polytechnic'),
                            ChipData('University'),
                            ChipData('IIT'),
                            ChipData('Coaching Center'),
                            ChipData('Other Institute')
                          ],
                          onChanged: (val) => setState(
                              () => _model.requirementForValue = val?.first),
                          selectedChipStyle: ChipStyle(
                            backgroundColor:
                                FlutterFlowTheme.of(context).primaryText,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Sora',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  fontSize: 13.0,
                                ),
                            iconColor: FlutterFlowTheme.of(context).primaryText,
                            iconSize: 18.0,
                            labelPadding: const EdgeInsetsDirectional.fromSTEB(
                                14.0, 4.0, 14.0, 4.0),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          unselectedChipStyle: ChipStyle(
                            backgroundColor: const Color(0x00000000),
                            textStyle:
                                FlutterFlowTheme.of(context).bodySmall.override(
                                      fontFamily: 'Sora',
                                      color: const Color(0xB2001451),
                                      fontSize: 13.0,
                                    ),
                            iconColor: FlutterFlowTheme.of(context).primaryText,
                            iconSize: 18.0,
                            labelPadding: const EdgeInsetsDirectional.fromSTEB(
                                14.0, 4.0, 14.0, 4.0),
                            elevation: 0.0,
                            borderColor: FlutterFlowTheme.of(context).accent3,
                            borderWidth: 1.0,
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          chipSpacing: 5.0,
                          rowSpacing: 17.0,
                          multiselect: false,
                          alignment: WrapAlignment.start,
                          controller: _model.requirementForValueController ??=
                              FormFieldController<List<String>>(
                            [],
                          ),
                          wrapped: true,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            21.0, 23.0, 25.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Monthly Salay Range',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Sora',
                                    fontSize: 14.0,
                                  ),
                            ),
                            Text(
                              'Clear',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Sora',
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    fontSize: 13.0,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _model.salaryminController,
                              focusNode: _model.salaryminFocusNode,
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Sora',
                                      color:
                                          FlutterFlowTheme.of(context).accent2,
                                    ),
                                hintText: '30,000',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Sora',
                                      color:
                                          FlutterFlowTheme.of(context).accent2,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).accent3,
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(8.0),
                                    bottomRight: Radius.circular(0.0),
                                    topLeft: Radius.circular(8.0),
                                    topRight: Radius.circular(0.0),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(8.0),
                                    bottomRight: Radius.circular(0.0),
                                    topLeft: Radius.circular(8.0),
                                    topRight: Radius.circular(0.0),
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(8.0),
                                    bottomRight: Radius.circular(0.0),
                                    topLeft: Radius.circular(8.0),
                                    topRight: Radius.circular(0.0),
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(8.0),
                                    bottomRight: Radius.circular(0.0),
                                    topLeft: Radius.circular(8.0),
                                    topRight: Radius.circular(0.0),
                                  ),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true),
                              validator: _model.salaryminControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                          Container(
                            width: 40.0,
                            height: 50.0,
                            decoration: const BoxDecoration(
                              color: Color(0xFFF3F5F7),
                            ),
                            child: Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                'TO',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Sora',
                                      fontSize: 13.0,
                                    ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: _model.salarytillController,
                              focusNode: _model.salarytillFocusNode,
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                hintText: '50,000',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Sora',
                                      color:
                                          FlutterFlowTheme.of(context).accent2,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).accent3,
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(0.0),
                                    bottomRight: Radius.circular(8.0),
                                    topLeft: Radius.circular(0.0),
                                    topRight: Radius.circular(8.0),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(0.0),
                                    bottomRight: Radius.circular(8.0),
                                    topLeft: Radius.circular(0.0),
                                    topRight: Radius.circular(8.0),
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(0.0),
                                    bottomRight: Radius.circular(8.0),
                                    topLeft: Radius.circular(0.0),
                                    topRight: Radius.circular(8.0),
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(0.0),
                                    bottomRight: Radius.circular(8.0),
                                    topLeft: Radius.circular(0.0),
                                    topRight: Radius.circular(8.0),
                                  ),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true),
                              validator: _model.salarytillControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ]
                            .addToStart(const SizedBox(width: 21.0))
                            .addToEnd(const SizedBox(width: 25.0)),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            21.0, 23.0, 25.0, 10.0),
                        child: Text(
                          'Regional Language',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Sora',
                                    fontSize: 14.0,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            21.0, 0.0, 25.0, 0.0),
                        child: FlutterFlowChoiceChips(
                          options: const [
                            ChipData('Tamil', Icons.add),
                            ChipData('Malayalam', Icons.add),
                            ChipData('Hindi', Icons.add)
                          ],
                          onChanged: (val) => setState(
                              () => _model.regionalLanguageValues = val),
                          selectedChipStyle: ChipStyle(
                            backgroundColor:
                                FlutterFlowTheme.of(context).primaryText,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Sora',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  fontSize: 13.0,
                                ),
                            iconColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            iconSize: 13.0,
                            labelPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 4.0, 14.0, 4.0),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          unselectedChipStyle: ChipStyle(
                            backgroundColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Sora',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 13.0,
                                ),
                            iconColor: FlutterFlowTheme.of(context).primaryText,
                            iconSize: 13.0,
                            labelPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 4.0, 14.0, 4.0),
                            elevation: 0.0,
                            borderColor: FlutterFlowTheme.of(context).accent3,
                            borderWidth: 1.0,
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          chipSpacing: 10.0,
                          rowSpacing: 10.0,
                          multiselect: true,
                          initialized: _model.regionalLanguageValues != null,
                          alignment: WrapAlignment.start,
                          controller: _model.regionalLanguageValueController ??=
                              FormFieldController<List<String>>(
                            [],
                          ),
                          wrapped: true,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            21.0, 23.0, 25.0, 10.0),
                        child: Text(
                          'English Level',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Sora',
                                    fontSize: 14.0,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            21.0, 0.0, 25.0, 0.0),
                        child: FlutterFlowChoiceChips(
                          options: const [
                            ChipData('No'),
                            ChipData('Basic'),
                            ChipData('Intermediate'),
                            ChipData('Advanced')
                          ],
                          onChanged: (val) => setState(
                              () => _model.englishLevelValue = val?.first),
                          selectedChipStyle: ChipStyle(
                            backgroundColor:
                                FlutterFlowTheme.of(context).primaryText,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Sora',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  fontSize: 13.0,
                                ),
                            iconColor: FlutterFlowTheme.of(context).primaryText,
                            iconSize: 18.0,
                            labelPadding: const EdgeInsetsDirectional.fromSTEB(
                                14.0, 4.0, 14.0, 4.0),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          unselectedChipStyle: ChipStyle(
                            backgroundColor: const Color(0x00000000),
                            textStyle:
                                FlutterFlowTheme.of(context).bodySmall.override(
                                      fontFamily: 'Sora',
                                      color: const Color(0xB2001451),
                                      fontSize: 13.0,
                                    ),
                            iconColor: FlutterFlowTheme.of(context).primaryText,
                            iconSize: 18.0,
                            labelPadding: const EdgeInsetsDirectional.fromSTEB(
                                14.0, 4.0, 14.0, 4.0),
                            elevation: 0.0,
                            borderColor: FlutterFlowTheme.of(context).accent3,
                            borderWidth: 1.0,
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          chipSpacing: 5.0,
                          rowSpacing: 17.0,
                          multiselect: false,
                          alignment: WrapAlignment.start,
                          controller: _model.englishLevelValueController ??=
                              FormFieldController<List<String>>(
                            [],
                          ),
                          wrapped: true,
                        ),
                      ),
                    ]
                        .addToStart(const SizedBox(height: 22.0))
                        .addToEnd(const SizedBox(height: 42.0)),
                  ),
                ),
              ),
              Divider(
                height: 1.0,
                thickness: 1.0,
                color: FlutterFlowTheme.of(context).accent3,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 26.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      text: 'Reset',
                      options: FFButtonOptions(
                        width: MediaQuery.sizeOf(context).width * 0.331,
                        height: 46.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily: 'Sora',
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primaryText,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                    ),
                    Expanded(
                      child: FFButtonWidget(
                        onPressed: () async {
                          if (((_model.salaryminController.text != '') &&
                                  (_model.salarytillController.text ==
                                          '')) ||
                              ((_model.salarytillController.text != '') &&
                                  (_model.salaryminController.text == ''))) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Please enter avalid filter field',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: const Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );
                          } else {
                            context.pushNamed(
                              'listCandidates',
                              queryParameters: {
                                'jobType': serializeParam(
                                  _model.choiceChipsValue,
                                  ParamType.String,
                                ),
                                'filtered': serializeParam(
                                  true,
                                  ParamType.bool,
                                ),
                                'educationType': serializeParam(
                                  _model.levelValue,
                                  ParamType.String,
                                ),
                                'educationDegree': serializeParam(
                                  _model.degreeValue,
                                  ParamType.String,
                                ),
                                'educationSubject': serializeParam(
                                  _model.subjectValue,
                                  ParamType.String,
                                ),
                                'monthlySalaryRangeFrom': serializeParam(
                                  int.tryParse(_model.salaryminController.text),
                                  ParamType.int,
                                ),
                                'monthlySalaryRangeTo': serializeParam(
                                  int.tryParse(
                                      _model.salarytillController.text),
                                  ParamType.int,
                                ),
                              }.withoutNulls,
                            );
                          }
                        },
                        text: 'Save Filter',
                        options: FFButtonOptions(
                          width: MediaQuery.sizeOf(context).width * 0.331,
                          height: 46.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).tertiary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Sora',
                                    color: Colors.white,
                                  ),
                          elevation: 0.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                      ),
                    ),
                  ]
                      .divide(const SizedBox(width: 15.0))
                      .addToStart(const SizedBox(width: 21.0))
                      .addToEnd(const SizedBox(width: 23.0)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
