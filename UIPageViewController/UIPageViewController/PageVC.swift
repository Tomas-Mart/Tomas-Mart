//
//  PageVC.swift
//  UIPageViewController
//
//  Created by Amina TomasMart on 21.12.2023.
//

import UIKit

class PageVC: UIPageViewController {
    
    let presentScreenContent = [
        "Первая страница презентаци: Установление контакта с клиентом. Выбор основы продаж для первичного общения будет зависеть от метода продаж.",
        "Вторая страница презентаци: Выяснение потребностей клиента. На этом этапе говорить должен клиент.",
        "Третья страница презентаци: Презентация продукта. Когда потребности клиента выяснены, можно предложить решение его проблемы.",
        "Четвертая страница презентаци: Проработка возражений. На данном этапе можно упомянуть о заказе или покупке.",
        "Последняя страница презентаци: Завершение продажи и последующие действия. Слишком затянутая презентация может спровоцировать обратный эффект.", ""
    ]
    let emojiArray = ["😉", "🧐", "🤓", "😎", "👍", ""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        
        if let contentVC = showVCAtIndex(0){
            setViewControllers([contentVC], direction: .forward, animated: true, completion: nil)
        }
    }
    func showVCAtIndex(_ index: Int) -> ContentVC? {
        guard index >= 0 else {return nil}
        guard index < presentScreenContent.count else {
            let userDefaults = UserDefaults.standard
            userDefaults.set(true, forKey: "presentationWasViewed")
            dismiss(animated: true, completion: nil)
            return nil
    }
    guard let contentVC = storyboard?.instantiateViewController(
        withIdentifier: "ContentVC") as? ContentVC else {return nil}
    
    contentVC.presentText = presentScreenContent[index]
    contentVC.emoji = emojiArray[index]
    contentVC.currentPage = index
    contentVC.numberOfPages = presentScreenContent.count
    
    return contentVC
   }
}
extension PageVC: UIPageViewControllerDataSource{
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var pageNum = (viewController as! ContentVC).currentPage
        pageNum -= 1
        
        return showVCAtIndex(pageNum)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, 
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var pageNum = (viewController as! ContentVC).currentPage
        pageNum += 1
        
        return showVCAtIndex(pageNum)
    }
    
    
}
