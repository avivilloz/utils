/*
 *  Copyright (C) 2019 cupnoodles <cupn8dles@gmail.com>
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  2.010-1301, USA.
 */

import QtQuick 2.5
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.5

import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.kquickcontrolsaddons 2.0 as KQuickAddons
import org.kde.kirigami 2.5 as Kirigami

ColumnLayout {

    property alias cfg_itemVerticalMargin: itemVerticalMarginSlider.value
    property alias cfg_itemHorizontalMargin: itemHorizontalMarginSlider.value
    property alias cfg_verticalSelectionMargin: verticalSelectionMarginSlider.value
    property alias cfg_horizontalSelectionMargin: horizontalSelectionMarginSlider.value
    property alias cfg_menuWidth: menuWidthSpinBox.value
    property alias cfg_menuHeight: menuHeightSpinBox.value
    property alias cfg_allowDragResize: allowMouseResizingCheckbox.checked
    property alias cfg_hideAllSubtitles: hideAllSubtitlesCheckbox.checked

    property alias cfg_iconSizeListViews: iconSizeListViewsSlider.iconSize

    Kirigami.FormLayout {
        Slider {
            id: iconSizeListViewsSlider
            Kirigami.FormData.label: i18n("List views icon size:")
            Layout.fillWidth: true
            from: 0
            to: 5
            stepSize: 1
            property int currentIconSize: plasmoid.configuration.iconSizeListViews
            value: iconSizes.indexOf(currentIconSize)

            property int iconSize: iconSizes[value]
            property variant iconSizes : [
                PlasmaCore.Units.iconSizes.small, PlasmaCore.Units.iconSizes.smallMedium,
                PlasmaCore.Units.iconSizes.medium, PlasmaCore.Units.iconSizes.large,
                PlasmaCore.Units.iconSizes.huge, PlasmaCore.Units.iconSizes.enormous
            ]

            onValueChanged: iconSize = iconSizes[value]
        }

        RowLayout {
            Layout.fillWidth: true

            Label {
                text: i18n("Small")
                Layout.alignment: Qt.AlignLeft
            }

            Item {
                Layout.fillWidth: true
            }

            Label {
                text: i18n("Large")
                Layout.alignment: Qt.AlignRight
            }
        }

        CheckBox {
            id: hideAllSubtitlesCheckbox
            text: i18n("Hide subtitles in list views")
        }


        Slider {
            id: itemHorizontalMarginSlider
            Kirigami.FormData.label: i18n("Horizontal inner margins:")
            Layout.fillWidth: true
            from: 0
            to: 8
            stepSize: 0.5
        }

        RowLayout {
            Layout.fillWidth: true

            Label {
                text: i18n("Small")
                Layout.alignment: Qt.AlignLeft
            }

            Item {
                Layout.fillWidth: true
            }

            Label {
                text: i18n("Large")
                Layout.alignment: Qt.AlignRight
            }
        }

        Slider {
            id: itemVerticalMarginSlider
            Kirigami.FormData.label: i18n("Vertical inner margins:")
            Layout.fillWidth: true
            from: 0
            to: 8
            stepSize: 0.5
        }

        RowLayout {
            Layout.fillWidth: true

            Label {
                text: i18n("Small")
                Layout.alignment: Qt.AlignLeft
            }

            Item {
                Layout.fillWidth: true
            }

            Label {
                text: i18n("Large")
                Layout.alignment: Qt.AlignRight
            }
        }

        Slider {
            id: horizontalSelectionMarginSlider
            Kirigami.FormData.label: i18n("Horizontal outer margins:")
            Layout.fillWidth: true
            from: 0
            to: 8
            stepSize: 0.5
        }

        RowLayout {
            Layout.fillWidth: true

            Label {
                text: i18n("Small")
                Layout.alignment: Qt.AlignLeft
            }

            Item {
                Layout.fillWidth: true
            }

            Label {
                text: i18n("Large")
                Layout.alignment: Qt.AlignRight
            }
        }

        Slider {
            id: verticalSelectionMarginSlider
            Kirigami.FormData.label: i18n("Vertical outer margins:")
            Layout.fillWidth: true
            from: 0
            to: 8
            stepSize: 0.5
        }

        RowLayout {
            Layout.fillWidth: true

            Label {
                text: i18n("Small")
                Layout.alignment: Qt.AlignLeft
            }

            Item {
                Layout.fillWidth: true
            }

            Label {
                text: i18n("Large")
                Layout.alignment: Qt.AlignRight
            }
        }

        Item {
            Kirigami.FormData.isSection: true
        }

        CheckBox {
            id: allowMouseResizingCheckbox
            text: i18n("Resize the menu using the mouse (Meta + RMB drag by default)")
        }

        RowLayout {
            spacing: 6
            enabled: !allowMouseResizingCheckbox.checked

            Kirigami.FormData.label: i18n("Menu width/height:")

            SpinBox {
                id: menuWidthSpinBox
                width: 200
                from: 15.0
                editable: true
                onValueChanged: {
                    plasmoid.configuration.menuWidth = menuWidthSpinBox.value;
                }
            }

            SpinBox {
                id: menuHeightSpinBox
                width: 200
                from: 15.0
                property int decimals: 2
                editable: true
                onValueChanged: {
                    plasmoid.configuration.menuHeight = menuHeightSpinBox.value;
                }
            }
        }

        Item {
            Kirigami.FormData.isSection: true
        }
    }

    Item {
        Layout.fillHeight: true
    }
}
