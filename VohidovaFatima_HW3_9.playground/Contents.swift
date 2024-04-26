import UIKit
import Foundation

"""
Для этой задачи я выберу проблему состояния гонки (race condition).

Пример состояния гонки может возникнуть, когда два или более потока пытаются одновременно изменить общий ресурс. Это может привести к непредсказуемым результатам из-за неопределенного порядка выполнения операций потоков.

Создадим простой пример в проекте Xcode, где два потока будут пытаться увеличить одну переменную одновременно, вызывая состояние гонки. Затем мы предложим решение этой проблемы с помощью синхронизации доступа к общему ресурсу.

"""

let concurrentQueue = DispatchQueue(label: "com.example.concurrent", attributes: .concurrent)

var sharedResource: Int = 0

DispatchQueue.concurrentPerform(iterations: 100) { iteration in
    concurrentQueue.async {
        // Небезопасное увеличение общего ресурса (состояние гонки)
        sharedResource += 1
        print("Поток \(iteration) увеличил sharedResource до \(sharedResource)")
    }
}

// Решение проблемы состояния гонки с использованием семафора
let semaphore = DispatchSemaphore(value: 1)

var sharedResourceSafe: Int = 0

DispatchQueue.concurrentPerform(iterations: 100) { iteration in
    concurrentQueue.async {
        semaphore.wait()
        sharedResourceSafe += 1
        print("Поток \(iteration) увеличил sharedResourceSafe до \(sharedResourceSafe)")
        semaphore.signal()
    }
}

"""
В этом примере мы используем DispatchQueue для создания состояния гонки при увеличении общего ресурса sharedResource. Затем мы используем механизм семафора для синхронизации доступа к общему ресурсу sharedResourceSafe, чтобы предотвратить состояние гонки.

Сделав так, мы гарантируем правильный порядок доступа к общему ресурсу и избегаем конфликтов между потоками при изменении переменной.
"""
