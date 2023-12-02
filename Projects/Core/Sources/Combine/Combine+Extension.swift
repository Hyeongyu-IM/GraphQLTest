//
//  Combine+Extension.swift
//  Core
//
//  Created by 임현규 on 12/2/23.
//  Copyright © 2023 com.hyeongyu. All rights reserved.
//

import Combine

public extension Publisher {
    ///Rxswift Throttle
    func coolDown<S: Scheduler>(for cooltime: S.SchedulerTimeType.Stride,
                                scheduler: S) -> some Publisher<Self.Output, Self.Failure> {
        return self.receive(on: scheduler)
            .scan((S.SchedulerTimeType?.none, Self.Output?.none)) {
                let eventTime = scheduler.now
                let minimumTolerance = scheduler.minimumTolerance
                guard let lastSentTime = $0.0 else {
                    return (eventTime, $1)
                }
                
                let diff = lastSentTime.distance(to: eventTime)
                
                guard diff >= (cooltime - minimumTolerance) else {
                    return (lastSentTime, nil)
                }
                
                return (eventTime, $1)
            }
            .compactMap { $0.1 }
    }
    
    func flatMapLatest<P: Publisher>(_ transform: @escaping (Output) -> P) -> Publishers.SwitchToLatest<P, Publishers.Map<Self, P>> {
        map(transform).switchToLatest()
    }
    
    func mapToVoid() -> Publishers.Map<Self, Void> {
        map { _ in () }
    }
    
    func mapToValue<Value>(_ value: Value) -> Publishers.Map<Self, Value> {
        map { _ in value }
    }
}
