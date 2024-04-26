import UIKit

var greeting = "Hello, playground"

// MARK: -
func someMethod() {
    let a = 5
    let b = 10
    
    var test: Void {
        print("test")
    }
    test
    
    var blok: String {
        "blok"
    }
    print(blok)
    
    let sum = {
        print(a+b)
    }
    sum()
}
someMethod()

// MARK: -
func someMethodTest() {
    var text = "Hello"
    
    print("Hello")
    
    defer {
        print("World")
    }
    print("Exit")
}
someMethodTest()

// MARK: -
func someMethodText() -> String {
    var text = "Hello"
    
    defer {
        text = "Exit"
        print(text)
    }
    text = "World"
    return text
}
print(someMethodText())

// MARK: -
enum TraficLight {
    case red(String), yellow(String), green(String)
}
let trafic = TraficLight.green("Зеленый")
print(trafic)

// MARK: -
enum TraficLight1: Int {
    case red = 1, yellow, green
}
let trafic1 = TraficLight1.green.rawValue
print(trafic1)

// MARK: -
enum TraficLight2: String {
    case red = "Красный"
    case yellow = "Желтый"
    case green = "Зеленый"
}
let trafic2 = TraficLight2.green.rawValue
print(trafic2)

// MARK: -
enum TraficLight3 {
    case red, yellow, green
    
    func hello() -> String {
        "Hello"
    }
}
let trafic3 = TraficLight3.green.hello()
print(trafic3)

// MARK: -
enum TraficLight4 {
    case red, yellow, green
    
    mutating func next() {
        switch self {
        case .red:
            self = .green
        case .yellow:
            self = .red
        case .green:
            self = .yellow
        }
    }
}
var svetofor = TraficLight4.green
for item in 1..<4 {
    print(svetofor)
    svetofor.next()
}

// MARK: -
enum NavigationState {
    case home(String)
    case profile(String)
    case settings(String)
}
var currentNavigationState: NavigationState?
func displayCurrentState() {
    guard let state = currentNavigationState else {
        print("Текущее состояние навигации не установлено")
        return
    }
    switch state {
        
    case .home(let homeWindow):
        print("\(homeWindow)\nВы ввели пароль")
    case .profile(let profileWindow):
        print("\(profileWindow) Амина Томас-Март")
    case .settings(let settingsWindow):
        print("\(settingsWindow)\nСтиль: темный\nID профиля: \(UUID().uuidString)")
    }
}
func navigate(to state: NavigationState) {
    currentNavigationState = state
    displayCurrentState()
}
navigate(to: .home("Для входа введите пароль"))
navigate(to: .profile("Ваши ФИО:"))
navigate(to: .settings("Ваши нстройки:"))

// MARK: -
enum HTTPMethod {
    case get
    case post(param: [String : String])
    
}
func performRequest(method: HTTPMethod) {
    switch method {
    case .get:
        print("Вы выполнили get запрос")
    case .post(param: let param):
        print("Вы выполнили post запрос: \(param.keys) \(param.values)")
    }
}
func sendPost() -> [String : String] {
    return ["логин" : "пароль"]
}
let getMethod = HTTPMethod.get
let postMethod = HTTPMethod.post(param: sendPost())
performRequest(method: postMethod)

// MARK: -
enum MathOperation {
    case add
    case substract
    
    func compute(lhs: Float, rhs: Float) -> Float {
        switch self {
        case .add:
            return lhs+rhs
        case .substract:
            return lhs-rhs
        }
    }
}
let add = MathOperation.add
let sub = MathOperation.substract
func calculate(_ a: Float, _ operation: MathOperation, _ b: Float) {
    print(operation.compute(lhs: a, rhs: b))
}
calculate(50, .substract, 30)

// MARK: -
indirect enum ArifmeticExpression {
    case num(Int)
    case add(ArifmeticExpression, ArifmeticExpression)
    case mul(ArifmeticExpression, ArifmeticExpression)
    
    func result() -> Int {
        switch self {
            
        case .num(let value):
            return value
        case .add(let lhs, let rhs):
            return lhs.result() + rhs.result()
        case .mul(let lhs, let rhs):
            return lhs.result() * rhs.result()
            
        }
    }
}
let num1 = ArifmeticExpression.num(5)
let num2 = ArifmeticExpression.num(2)
let mult = ArifmeticExpression.mul(num1, num2)
print(mult.result())

// MARK: -
enum Barcode {
    case upCode(Int, Int, Int, Int)
    case qrCode(String)
}
func performBarcode(for code: Barcode) {
    switch code {
        
    case .upCode(let numSystem, let numManufacturer, let numProduct, let numCheck):
        print("upCode: \(numSystem)\(numManufacturer)\(numProduct)\(numCheck)")
    case .qrCode(let qrCode):
        print("qrCode: \(qrCode)")
    }
}
let productBarcode = Barcode.upCode(4, 8, 1, 9)
let productBarcode1 = Barcode.qrCode("qwertyuiop")
performBarcode(for: productBarcode)
performBarcode(for: productBarcode1)

// MARK: - Задание 1: Времена года и их температура.

// Перечисление времен года
enum Season {
    case winter(Int, Int, Int)
    case spring(Int, Int, Int)
    case summer(Int, Int, Int)
    case fall(Int, Int, Int)
    
    // MARK: - Первый способ
    // Вычисляемое свойство для средней температуры
    var averageTemperature: Int {
        switch self {
        case .winter(let mon1, let mon2, let mon3):
            return (mon1+mon2+mon3)/3 // Средняя температура зимой
        case .spring(let mon4, let mon5, let mon6):
            return (mon4+mon5+mon6)/3 // Средняя температура весной
        case .summer(let mon7, let mon8, let mon9):
            return (mon7+mon8+mon9)/3 // Средняя температура летом
        case .fall(let mon10, let mon11, let mon12):
            return (mon10+mon11+mon12)/3 // Средняя температура осенью
        }
    }
}

// Функция для вывода средней температуры для выбранного времени года
func printAverageTemperature(for season: Season) {
    switch season {
    case .winter:
        print("Средняя температура зимой: \(season.averageTemperature) градусов Цельсия")
    case .spring:
        print("Средняя температура весной: \(season.averageTemperature) градусов Цельсия")
    case .summer:
        print("Средняя температура летом: \(season.averageTemperature) градусов Цельсия")
    case .fall:
        print("Средняя температура осенью: \(season.averageTemperature) градусов Цельсия")
    }
}
printAverageTemperature(for: .winter(-35, -30, -25))
printAverageTemperature(for: .spring(5, 10, 15))
printAverageTemperature(for: .summer(30, 25, 20))
printAverageTemperature(for: .fall(-5, 0, 5))

// MARK: - Второй способ
func getAverageTemperature(for season: Season) {
    switch season {
        
    case .winter(let mon1, let mon2, let mon3):
        print("Средняя температура зимой: \((mon1+mon2+mon3)/3) градусов Цельсия")
    case .spring(let mon4, let mon5, let mon6):
        print("Средняя температура весной: \((mon4+mon5+mon6)/3) градусов Цельсия")
    case .summer(let mon7, let mon8, let mon9):
        print("Средняя температура летом: \((mon7+mon8+mon9)/3) градусов Цельсия")
    case .fall(let mon10, let mon11, let mon12):
        print("Средняя температура осенью: \((mon10+mon11+mon12)/3) градусов Цельсия")
        
    }
}
let averageTemperatureWinter = Season.winter(-35, -30, -25)
let averageTemperatureSpring = Season.spring(5, 10, 15)
let averageTemperatureSummer = Season.summer(30, 25, 20)
let averageTemperatureFall = Season.fall(-5, 0, 5)

getAverageTemperature(for: averageTemperatureWinter)
getAverageTemperature(for: averageTemperatureSpring)
getAverageTemperature(for: averageTemperatureSummer)
getAverageTemperature(for: averageTemperatureFall)

// MARK: - Задание 2: Информация о транспортных средствах.

// Перечисление транспортных средств и их максимальных скоростей
enum Transport {
    case car(maxSpeed: Int), bicycle(maxSpeed: Int), train(maxSpeed: Int), airplane(maxSpeed: Int)
}

// Функция для вывода информации о максимальной скорости для выбранного транспортного средства
func printMaxSpeed(for transport: Transport) {
    switch transport {
    case .car(let maxSpeed):
        print("Максимальная скорость автомобиля: \(maxSpeed) км/ч")
    case .bicycle(let maxSpeed):
        print("Максимальная скорость велосипеда: \(maxSpeed) км/ч")
    case .train(let maxSpeed):
        print("Максимальная скорость поезда: \(maxSpeed) км/ч")
    case .airplane(let maxSpeed):
        print("Максимальная скорость самолета: \(maxSpeed) км/ч")
    }
}
let car = Transport.car(maxSpeed: 200)
let bicycle = Transport.bicycle(maxSpeed: 30)
let train = Transport.train(maxSpeed: 150)
let airplane = Transport.airplane(maxSpeed: 900)

printMaxSpeed(for: car)
printMaxSpeed(for: bicycle)
printMaxSpeed(for: train)
printMaxSpeed(for: airplane)

// Функция для вычисления транспорта с самым высоким значением максимальной скорости
func findFastestTransport(for transportArray: [Transport]) -> Transport? {
    return transportArray.max { transport1, transport2 in
        let speed1: Int
        let speed2: Int
        
        switch transport1 {
        case .car(let maxSpeed):
            speed1 = maxSpeed
        case .bicycle(let maxSpeed):
            speed1 = maxSpeed
        case .train(let maxSpeed):
            speed1 = maxSpeed
        case .airplane(let maxSpeed):
            speed1 = maxSpeed
        }
        
        switch transport2 {
        case .car(let maxSpeed):
            speed2 = maxSpeed
        case .bicycle(let maxSpeed):
            speed2 = maxSpeed
        case .train(let maxSpeed):
            speed2 = maxSpeed
        case .airplane(let maxSpeed):
            speed2 = maxSpeed
        }
        
        return speed1 < speed2
    }
}
let transports = [car, bicycle, train, airplane]
if let fastestTransport = findFastestTransport(for: transports) {
    print("Транспорт с самой высокой максимальной скоростью: \(fastestTransport)")
}

// MARK: - Задание 3: Статусы платежей

// Перечисление статусов платежей и дополнительной информации
enum PaymentStatus {
    case unpaid
    case processing
    case paid(paymentDate: Date)
    case error(errorMessage: String)
    
    // Функция для получения дополнительной информации о платеже
    func getPaymentDetails() {
        switch self {
        case .unpaid:
            print("Статус: Неоплачено")
        case .processing:
            print("Статус: В обработке")
        case .paid(let paymentDate):
            print("Статус: Оплачено")
            print("Дата оплаты: \(paymentDate)")
        case .error(let errorMessage):
            print("Статус: Ошибка")
            print("Причина ошибки: \(errorMessage)")
        }
    }
}
let unpaidPayment = PaymentStatus.unpaid
let processingPayment = PaymentStatus.processing
let paidPayment = PaymentStatus.paid(paymentDate: .now)
let errorPayment = PaymentStatus.error(errorMessage: "Недостаточно средств")

unpaidPayment.getPaymentDetails()
processingPayment.getPaymentDetails()
paidPayment.getPaymentDetails()
errorPayment.getPaymentDetails()

// MARK: - Задание 4: Рекомендации по режимам камеры

// Перечисление режимов фотокамеры и рекомендаций
enum CameraMode {
    case auto, portrait, landscape, night
}

// Функция для получения рекомендаций по использованию режима камеры
func getRecommendation(for cameraMode: CameraMode) {
    switch cameraMode {
    case .auto:
        print("Режим: Авто")
        print("Рекомендация: Режим Авто подходит для ежедневного использования в большинстве ситуаций, когда вы хотите, чтобы камера автоматически подстраивалась под условия съемки.")
    case .portrait:
        print("Режим: Портрет")
        print("Рекомендация: Режим Портрет идеально подходит для съемки портретов, где фон должен быть размыт, чтобы подчеркнуть объект.")
    case .landscape:
        print("Режим: Ландшафт")
        print("Рекомендация: Режим Ландшафт рекомендуется для съемки пейзажей, где важно иметь максимальную глубину резкости и хорошую детализацию.")
    case .night:
        print("Режим: Ночной")
        print("Рекомендация: Режим Ночной предназначен для съемки в условиях плохого освещения, помогая получить более яркие и четкие фотографии в ночное время.")
    }
}
let autoMode = CameraMode.auto
let portraitMode = CameraMode.portrait
let landscapeMode = CameraMode.landscape
let nightMode = CameraMode.night

getRecommendation(for: .auto)
getRecommendation(for: .portrait)
getRecommendation(for: .landscape)
getRecommendation(for: .night)

// MARK: - Задание 5: Диеты животных в зоопарке

// Перечисление типов животных и их диеты
enum AnimalType {
    case predator, herbivore, insect
    
    // Функция для получения информации о диете животного
    func getDiet() -> String {
        switch self {
        case .predator:
            return "- это хищник, питается другими животными."
        case .herbivore:
            return "- это травоядное, питается растениями и травой."
        case .insect:
            return "- это насекомое, питается пыльцой, нектаром или другими насекомыми."
        }
    }
}

// Определение типов животных и их диеты
let lion = AnimalType.predator.getDiet()
let elephant = AnimalType.herbivore.getDiet()
let bee = AnimalType.insect.getDiet()

// Вывод информации о типах животных и их диеты
print("Лев \(lion)")
print("Слон \(elephant)")
print("Пчела \(bee)")

// MARK: - Задание 6: Отслеживание статуса заказа в ресторане

// Перечисление статусов заказа и функция для получения следующего статуса
enum OrderStatus {
    case accepted, preparing, readyForServing, delivering
    
    // Функция для получения следующего статуса
    mutating func nextStatus() {
        switch self {
        case .accepted:
            self = .preparing
            print("Принят")
            print("Текущий статус заказа: готовится")
        case .preparing:
            self = .readyForServing
            print("Готовится")
            print("Текущий статус заказа: готов к подаче")
        case .readyForServing:
            self = .delivering
            print("Готов к подаче")
            print("Текущий статус заказа: доставляется")
        case .delivering:
            print("Доставляется")
            print("Оцените качество обслуживания")
        }
    }
}
var status = OrderStatus.delivering
print(status)
status.nextStatus()

// MARK: - Второй способ

// Перечисление статусов заказа и функция для определения следующего статуса
enum OrderStatus1 {
    case accepted, preparing, readyToServe, delivering
    
    // Функция для определения следующего статуса
    func nextStatus1() -> OrderStatus1? {
        switch self {
        case .accepted:
            return .preparing
        case .preparing:
            return .readyToServe
        case .readyToServe:
            return .delivering
        case .delivering:
            return nil // После этого статуса нет следующего
        }
    }
}
let currentStatus = OrderStatus1.delivering
if let nextStatus = currentStatus.nextStatus1() {
    print("Следующий статус после \(currentStatus): \(nextStatus)")
} else {
    print("\(currentStatus) - последний статус, следующего нет.")
}

// MARK: - Задание 7: Информация о номерах в отеле

// Перечисление типов комнат и информация о каждом типе
enum RoomType {
    case single(price: Double, availableRooms: Int)
    case double(price: Double, availableRooms: Int)
    case luxury(price: Double, availableRooms: Int)
}

// Функция для получения информации о выбранном типе комнаты
func getRoomDetails(for roomType: RoomType) {
    switch roomType {
        
    case .single(price: let price, availableRooms: let availableRooms):
        print("Одноместный номер: cтоимость за ночь: \(price) рублей, доступно: \(availableRooms) номеров")
    case .double(price: let price, availableRooms: let availableRooms):
        print("Двухместный номер: cтоимость за ночь: \(price) рублей, доступно: \(availableRooms) номеров")
    case .luxury(price: let price, availableRooms: let availableRooms):
        print("Люкс номер: cтоимость за ночь: \(price) рублей, доступно: \(availableRooms) номеров")
    }
}

// Получение и вывод информации о выбранном типе комнаты
let singleRoom = RoomType.single(price: 1500, availableRooms: 10)
getRoomDetails(for: singleRoom)
let doubleRoom = RoomType.double(price: 3000, availableRooms: 8)
getRoomDetails(for: doubleRoom)
let luxuryRoom = RoomType.luxury(price: 10000, availableRooms: 5)
getRoomDetails(for: luxuryRoom)

// MARK: - Задание 8: Уровни сложности в игре

// Перечисление уровней сложности и параметры для каждого уровня
enum DifficultyLevel {
    case easy(numberOfEnemies: Int, timeLimit: Int)
    case medium(numberOfEnemies: Int, timeLimit: Int)
    case hard(numberOfEnemies: Int, timeLimit: Int)
    case expert(numberOfEnemies: Int, timeLimit: Int)
}

// Функция для получения параметров игры для выбранного уровня сложности
func getGameParameters(for difficultyLevel: DifficultyLevel) {
    switch difficultyLevel {
        
    case .easy(numberOfEnemies: let numberOfEnemies, timeLimit: let timeLimit):
        print("Уровень сложности: легкий, количество врагов: \(numberOfEnemies) человек, ограничение времени: \(timeLimit) секунд")
    case .medium(numberOfEnemies: let numberOfEnemies, timeLimit: let timeLimit):
        print("Уровень сложности: средний, количество врагов: \(numberOfEnemies) человек, ограничение времени: \(timeLimit) секунд")
    case .hard(numberOfEnemies: let numberOfEnemies, timeLimit: let timeLimit):
        print("Уровень сложности: тяжелый, количество врагов: \(numberOfEnemies) человек, ограничение времени: \(timeLimit) секунд")
    case .expert(numberOfEnemies: let numberOfEnemies, timeLimit: let timeLimit):
        print("Уровень сложности: эксперт, количество врагов: \(numberOfEnemies) человек, ограничение времени: \(timeLimit) секунд")
    }
}

// Получение и вывод параметров игры для выбранного уровня сложности
let easyLevel = DifficultyLevel.easy(numberOfEnemies: 5, timeLimit: 60)
getGameParameters(for: easyLevel)
let mediumLevel = DifficultyLevel.medium(numberOfEnemies: 10, timeLimit: 45)
getGameParameters(for: mediumLevel)
let hardLevel = DifficultyLevel.hard(numberOfEnemies: 15, timeLimit: 30)
getGameParameters(for: hardLevel)
let expertLevel = DifficultyLevel.expert(numberOfEnemies: 20, timeLimit: 15)
getGameParameters(for: expertLevel)

// MARK: - Задание 9: Прогноз погоды по облачности

// Перечисление уровней облачности и вероятность осадков для каждого уровня
enum Cloudiness {
    case clear(precipitationProbability: Int)
    case partlyCloudy(precipitationProbability: Int)
    case cloudy(precipitationProbability: Int)
    case overcast(precipitationProbability: Int)
}

// Функция для получения вероятности осадков для выбранного уровня облачности
func getWeatherForecast(for cloudiness: Cloudiness) {
    switch cloudiness {
        
    case .clear(precipitationProbability: let precipitationProbability):
        print("Уровень облачности: ясно, вероятность осадков: \(precipitationProbability)%")
    case .partlyCloudy(precipitationProbability: let precipitationProbability):
        print("Уровень облачности: частичная облачность, вероятность осадков: \(precipitationProbability)%")
    case .cloudy(precipitationProbability: let precipitationProbability):
        print("Уровень облачности: облачно, вероятность осадков: \(precipitationProbability)%")
    case .overcast(precipitationProbability: let precipitationProbability):
        print("Уровень облачности: пасмурно, вероятность осадков: \(precipitationProbability)%")
        
    }
}
// Получение и вывод прогноза вероятности осадков для выбранного уровня облачности
let clear = Cloudiness.clear(precipitationProbability: 15)
getWeatherForecast(for: clear)
let partlyCloudy = Cloudiness.partlyCloudy(precipitationProbability: 50)
getWeatherForecast(for: partlyCloudy)
let cloudy = Cloudiness.cloudy(precipitationProbability: 70)
getWeatherForecast(for: cloudy)
let overcast = Cloudiness.overcast(precipitationProbability: 90)
getWeatherForecast(for: overcast)

// MARK: - Задание 10: Цены напитков в автомате

// Перечисление типов напитков и информация о каждом типе
enum DrinkType {
    case coffee
    case tea
    case hotChocolate
    case water
    
    var price: Double {
        switch self {
        case .coffee:
            return 2.50
        case .tea:
            return 1.80
        case .hotChocolate:
            return 3.00
        case .water:
            return 1.00
        }
    }
}

// Функция для получения стоимости выбранного напитка
func getDrinkPrice(for drinkType: DrinkType) -> Double {
    let price = drinkType.price
    return price
}
// Получение и вывод стоимости выбранного напитка
let selectedDrink1 = DrinkType.coffee
let drinkPrice1 = getDrinkPrice(for: selectedDrink1)
print("Выбранный напиток: \(selectedDrink1)")
print("Стоимость: $\(drinkPrice1)")

let selectedDrink2 = DrinkType.tea
let drinkPrice2 = getDrinkPrice(for: selectedDrink2)
print("Выбранный напиток: \(selectedDrink2)")
print("Стоимость: $\(drinkPrice2)")

let selectedDrink3 = DrinkType.hotChocolate
let drinkPrice3 = getDrinkPrice(for: selectedDrink3)
print("Выбранный напиток: \(selectedDrink3)")
print("Стоимость: $\(drinkPrice3)")

let selectedDrink4 = DrinkType.water
let drinkPrice4 = getDrinkPrice(for: selectedDrink4)
print("Выбранный напиток: \(selectedDrink4)")
print("Стоимость: $\(drinkPrice4)")

// MARK: - Задание 11: Различные типы документов

// Перечисление типов документов с уникальными строковыми идентификаторами
enum DocumentType: String {
    case passport = "passport"
    case driverLicense = "driver_license"
    case idCard = "id_card"
}

// Метод, который возвращает описание типа документа
func getDescription(for documentType: DocumentType) -> String {
    switch documentType {
    case .passport:
        let document = DocumentType(rawValue: "passport")
        print("Тип документа: \(document!.rawValue.capitalized)\nОписание: документ, удостоверяющий личность и гражданство")
        return ""
    case .driverLicense:
        let document = DocumentType(rawValue: "driver_license")
        print("Тип документа: \(document!.rawValue.capitalized)\nОписание: документ, разрешающий управление автотранспортом")
        return ""
    case .idCard:
        let document = DocumentType(rawValue: "id_card")
        print("Тип документа: \(document!.rawValue.capitalized)\nОписание: документ, идентифицирующий личность")
        return ""
    }
}
// Создание экземпляра перечисления с использованием rawValue и вывод описания документа
let passportType = DocumentType.passport
getDescription(for: passportType)
let driverLicenseType = DocumentType.driverLicense
getDescription(for: driverLicenseType)
let idCardType = DocumentType.idCard
getDescription(for: idCardType)

// MARK: - Второй способ

// Перечисление типов документов с уникальными строковыми идентификаторами
enum DocumentType1: String {
    case passport = "passport"
    case driverLicense = "driver_license"
    case idCard = "id_card"
    
    func getDescription1() -> String {
        switch self {
        case .passport:
            return "Документ, удостоверяющий личность и гражданство"
        case .driverLicense:
            return "Документ, разрешающий управление автотранспортом"
        case .idCard:
            return "Документ, идентифицирующий личность"
        }
    }
}

// Создание экземпляра перечисления с использованием rawValue и вывод описания документа
if let document1 = DocumentType1(rawValue: "driver_license") {
    print("Тип документа: \(document1.rawValue.capitalized)")
    print("Описание: \(document1.getDescription1())")
} else {
    print("Документ с указанным типом не найден.")
}


