@testable import TMDbCore
//import Kingfisher

import RxSwift
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let disposeBag = DisposeBag()
let assembly = CoreAssembly()

let imageRepository = assembly.imageLoadingAssembly.imageRepository
// La línea de arriba es igual a lo de abajo, pero sin el assembly
//let webService = WebService(configuration: .default)
//let imageRepository = ImageRepository(webService: webService, imageManager: KingfisherManager.shared)

imageRepository.image(at: "ncEmkHADNggjR0dlerOIHqmiY0O.jpg", size: .w780)
	.subscribe(onNext: {
		let image = $0
		print(image)
	})
	.disposed(by: disposeBag)
