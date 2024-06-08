//
//  Step.swift
//  Yasta
//
//  Created by Antonio Cranga on 11.04.2024.
//

import Foundation

struct Step: Metric, Hashable {
    let id: UUID
    let workoutType: WorkoutType?
    let date: Date
    let type: Measure = .steps
    let count: Int

    var value: Double {
        Double(count)
    }

    func toJson() -> [String: Any] {
        return [
            "id": String(id.uuidString),
            "date": Double(date.timeIntervalSince1970 * 1000),
            "count": Int(count)
        ];
    }
}
