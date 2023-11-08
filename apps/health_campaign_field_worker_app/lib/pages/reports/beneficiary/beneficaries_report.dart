import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/scrollable_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/search_households/project_beneficiaries_downsync.dart';

class BeneficariesReportPage extends StatefulWidget {
  const BeneficariesReportPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return BeneficariesReportState();
  }
}

class BeneficariesReportState extends State<BeneficariesReportPage> {
  @override
  void initState() {
    final bloc = context.read<BeneficiaryDownSyncBloc>();
    bloc.add(
      const BeneficiaryDownSyncEvent.downSyncReport(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BeneficiaryDownSyncBloc, BeneficiaryDownSyncState>(
        builder: (ctx, state) {
          return state.maybeWhen(
            orElse: () => const Text(''),
            report: (downsyncCriteriaList) => Column(
              children: downsyncCriteriaList
                  .map(
                    (e) => DigitCard(
                      child: Column(
                        children: [Text(e.totalCount.toString())],
                      ),
                    ),
                  )
                  .toList(),
            ),
          );
        },
      ),
    );
  }
}