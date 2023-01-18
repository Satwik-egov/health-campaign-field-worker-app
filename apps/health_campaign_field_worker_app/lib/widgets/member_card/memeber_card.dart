import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import '../../blocs/localization/app_localization.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../action_card/action_card.dart';

class MemberCard extends StatelessWidget {
  final String name;
  final String gender;
  final int age;
  final bool? isHead;
  final bool isDelivered;
  final AppLocalizations localizations;

  const MemberCard({
    super.key,
    required this.name,
    required this.gender,
    required this.age,
    this.isHead,
    required this.localizations,
    required this.isDelivered,
  });
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: DigitTheme.instance.colorScheme.background,
        border: Border.all(
          color: DigitTheme.instance.colorScheme.background,
          width: 0.6,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(4.0),
        ),
      ),
      margin: DigitTheme.instance.containerMargin,
      padding: const EdgeInsets.all(8),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Text(
                    localizations.translate(name),
                    style: theme.textTheme.bodyLarge,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Row(
                    children: [
                      Container(
                        margin: DigitTheme.instance.containerMargin,
                        child: Text(
                          localizations.translate(gender),
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
                      Text(
                        " | ${age} ${localizations.translate(i18.memberCard.deliverDetailsYearText)}",
                        style: theme.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            DigitIconButton(
              onPressed: () => DigitActionDialog.show(
                context,
                widget: ActionCard(
                  items: [
                    // ignore: no-empty-block
                    ActionCardModel(
                      Icons.person,
                      localizations
                          .translate(i18.memberCard.assignAsHouseholdhead),
                      () {},
                    ),
                    ActionCardModel(
                      Icons.edit,
                      localizations
                          .translate(i18.memberCard.editIndividualDetails),
                      () {},
                    ),
                    ActionCardModel(
                      Icons.delete,
                      localizations
                          .translate(i18.memberCard.deleteIndividualActionText),
                      () {
                        DigitDialog.show(
                          context,
                          title: localizations.translate(i18.householdOverView
                              .householdOverViewActionCardTitle),
                          primaryActionLabel: localizations.translate(i18
                              .householdOverView
                              .householdOverViewPrimaryActionLabel),
                          primaryAction: () =>
                              Navigator.of(context, rootNavigator: true).pop(),
                          secondaryActionLabel: localizations.translate(i18
                              .householdOverView
                              .householdOverViewSecondaryActionLabel),
                          secondaryAction: () =>
                              Navigator.of(context, rootNavigator: true).pop(),
                        );
                      },
                    ),
                  ],
                ),
              ),
              iconText: localizations.translate(
                i18.householdOverView.householdOverViewEditIconText,
              ),
              icon: Icons.edit,
            ),
          ],
        ),
        isDelivered
            ? DigitIconButton(
                icon: Icons.info_rounded,
                iconText: localizations.translate(i18
                    .householdOverView.householdOverViewNotDeliveredIconLabel),
                iconTextColor: theme.errorColor,
                iconColor: theme.errorColor,
              )
            : DigitIconButton(
                icon: Icons.check_circle,
                iconText: localizations.translate(
                  i18.householdOverView.householdOverViewDeliveredIconLabel,
                ),
                iconTextColor: DigitTheme.instance.colorScheme.onSurfaceVariant,
                iconColor: DigitTheme.instance.colorScheme.onSurfaceVariant,
              ),
        isDelivered
            ? DigitElevatedButton(
                onPressed: () {
                  print("");
                },
                child: Center(
                  child: Text(localizations.translate(
                    i18.memberCard.deliverInterventionSubmitLabel,
                  )),
                ),
              )
            : SizedBox(
                width: MediaQuery.of(context).size.width,
                child: DigitOutLineButton(
                  label: localizations
                      .translate(i18.memberCard.deliverDetailsUpdateLabel),
                  onPressed: () {},
                ),
              ),
      ]),
    );
  }
}
