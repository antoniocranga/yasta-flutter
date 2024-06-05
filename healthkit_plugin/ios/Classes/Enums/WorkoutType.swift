//
//  WorkoutType.swift
//  Yasta
//
//  Created by Antonio Cranga on 11.04.2024.
//

import Foundation

enum WorkoutType: String, CaseIterable, Identifiable {
    case running
    case walking
    case cycling
}

extension WorkoutType {
    var id: Self { self }

    var name: String {
        switch self {
        case .running: return "Running"
        case .walking: return "Walking"
        case .cycling: return "Cycling"
        }
    }

    var icon: String {
        switch self {
        case .running: return "figure.run"
        case .walking: return "figure.walk"
        case .cycling: return "figure.outdoor.cycle"
        }
    }

    var banner: String {
        switch self {
        case .running: return "runningBanner"
        case .walking: return "walkingBanner"
        case .cycling: return "cyclingBanner"
        }
    }

    var background: String {
        switch self {
        case .running: return "runningBackground"
        case .walking: return "walkingBackground"
        case .cycling: return "cyclingBackground"
        }
    }
}
