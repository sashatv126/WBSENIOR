//
//  ContainerView.swift
//  WBSenior
//
//  Created by Александр Плетников on 21.07.2024.
//

import SwiftUI

struct ContainerView: View {
    @EnvironmentObject var languageManager: LanguageManager
    let distance: Double = 360789 // основная ед метры

    var body: some View {
        VStack(spacing: 16) {
            Text("hello".localized())

            dateView

            distanceView

            Button("change_language".localized()) {
                languageManager.currentLanguage = languageManager.currentLanguage == "en" ? "ru" : "en"
            }
        }
    }

    @ViewBuilder
    private var dateView: some View {
        VStack {
            Text("short".localized() + " \(formattedDate(date: Date(), style: .short))")
            Text("medium".localized() + " \(formattedDate(date: Date(), style: .medium))")
            Text("long".localized() + " \(formattedDate(date: Date(), style: .long))")
        }
    }

    @ViewBuilder
    private var distanceView: some View {
        VStack {
            Text("distance".localized())
            Text("meters".localized() + " \(distance)" + " m")
            Text("kilometers".localized() + " \(convertDistance(meters: distance, to: .kilometers))")
            Text("miles".localized() + " \(convertDistance(meters: distance, to: .miles))")
        }
    }

    private func formattedDate(date: Date, style: DateFormatter.Style) -> String {
        let formatter = DateFormatter.formatter
        formatter.dateStyle = style
        formatter.timeStyle = style
        return formatter.string(from: date)
    }

    private func convertDistance(meters: Double, to unit: UnitLength) -> String {
        let measurement = Measurement(value: meters, unit: UnitLength.meters)
        let convertedMeasurement = measurement.converted(to: unit)
        let formatter = MeasurementFormatter()
        formatter.unitStyle = .medium
        formatter.locale = Locale.current
        return formatter.string(from: convertedMeasurement)
    }
}


#Preview {
    ContainerView()
}

extension String {
    func localized() -> String {
        LocalizedBundle.shared.localizedString(forKey: self)
    }
}
