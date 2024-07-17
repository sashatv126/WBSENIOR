//
//  TimeButtonVIew.swift
//  WBSenior
//
//  Created by Александр Плетников on 17.07.2024.
//

import SwiftUI

public struct TimerButtonView: View {
    @Binding private var timeRemaining: Int
    
    private let timer = Timer
        .publish(every: 1, on: .main, in: .common)
        .autoconnect()

    private let didTapButton: () -> ()

    public init(timeRemaining: Binding<Int>, didTapButton: @escaping () -> Void) {
        self._timeRemaining = timeRemaining
        self.didTapButton = didTapButton
    }

    public var body: some View {
        Button(action: {
            didTapButton()
        }, label: {
            Text(timeRemaining == 0 ? "Запросить код снова" : "Запросить повторно через \(timeRemaining) сек")
                .font(BasicFont.body14)
                .foregroundColor(.white)
                .onReceive(timer) { _ in
                    if timeRemaining > 0 {
                        timeRemaining -= 1
                    }
                }
                .underline(timeRemaining == 0)
        })
        .disabled(timeRemaining > 0)
    }
}
