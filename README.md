# README

# 박스오피스 🎬
> 영화진흥위원회 API를 기반으로 박스오피스 리스트를 보여주는 프로젝트
> 사용한 기술
> * modernCollectionView - List Layout / Icon Layout (CompositionalLayout)
> * JSONData Parsing - 영화진흥위원회 BoxOfficeData
> * URLSession - Get Http메서드를 바탕으로 데이터 요청 구현
> * CalendarView - CalendarView를 통한 날짜 선택 기능 구현
> * NetWorkLayer - Service - Provide - Endpoint 구조 구현

---
## 목차 📋
1. [팀원 소개](#1-팀원-소개)
2. [타임라인](#2-타임라인)
3. [파일 구조](#3-파일-구조)
4. [실행화면](#4-실행화면)
5. [트러블 슈팅](#5-트러블-슈팅)
6. [Reference](#6-Reference)
7. [팀 회고](#7-팀-회고)

---

</br>

## 1. 팀원 소개
|Goat|songjun|
|:---:|:---:|
|<img src="https://i.imgur.com/yoWVC56.png" width="140" height="140"/>|<img src="https://i.imgur.com/9Bd6NIT.png" width="140">|
|[github]( https://github.com/Goatt8)|[github](https://github.com/kimseongj)|

</br>

## 2. 타임라인

<details>
    <summary><big>타임라인</big></summary>
    
|날짜|진행 내용|
|---|---|
|2023-03-20|BoxOfficeResult JSON데이터모델, BoxOfficeParser구현|
|2023-03-21|Codingkeys적용, Parser 제네릭으로 구현|
|2023-03-22|loadBoxOfficeAPI 매서드 delegate패턴으로 viewController와 연결 구현|
|2023-03-23|delegate 패턴을 통한 데이터 전달을 completionHandler로 수정|
|2023-03-24|fetchAPIData 메서드로 JSON데이터 API받아오기 구현|
|2023-03-27|네트워크 모델을 Endpoint - Provider로 재구성|
|2023-03-28|[스크롤뷰 - 스택뷰 - 이미지뷰 - 레이블] 구조 / 코드를 활용한 UI구성|
|2023-03-29|Provider 구현|
|2023-03-30|오토레이아웃 구현 및  movieDetail 파싱된 데이터 view와 연결구현|
|2023-03-31|Endpoint 모델 protocol로 채택후 각 데이터모델 구조체로 구현|
|2023-04-03|MovieDetailViewController ImageSearch 데이터모델 구현|
|2023-04-04|EndPoint String 모델 제거하고 각각 구조체에 String value 할당|
|2023-04-05|BoxOfficeService 구현, CalenderView에서 받아온 날짜데이터 format변경|
|2023-04-06|날짜선택 제한구현, setCalenderViewSelectionBehavior구현|
|2023-04-07|날짜 format변경방식 String Extension에서 DateFormatter사용하는방식으로 변경|
|2023-04-10|메인화면의 Present 방식을 Icon, List로 구현|
|2023-04-11|Dynamic Type 구현|
|2023-04-12|오토레이아웃 리팩토링|
|2023-04-13|imageSearch에 cache데이터 삭제 메서드 구현|
|2023-04-14|URLcache 삭제 메서드 구현|
    
</details>

</br>
    
## 3. 파일 구조

<details>
    <summary><big>폴더 구조</big></summary>

``` swift
BoxOffice
    │
    ├── Application
    │      ├── AppDelegate
    │      └── SceneDelegate
    ├── Model
    │      ├── DailyBoxOffice
    │      ├── MovieDetail
    │      ├── ImageSearch
    │      ├── BoxOfficeService
    │      └── ImageSearchService
    ├── NetWork
    │      ├── EndPointMakeable
    │      ├── MovieDetailEndpoint
    │      ├── DailyBoxOfficeEndpoint
    │      ├── ImageSearchEndPoint
    │      ├── parser
    │      ├── HTTPMethod
    │      └── Provider
    ├── View
    │      ├── Main
    │      ├── BoxOfficeListCell
    │      ├── CalendarView
    │      └── MovieDetailView
    ├── Controller
    │      ├── MovieDetailViewController
    │      ├── CalendarViewController
    │      └── BoxOfficeViewController
    ├── Extension
    │      ├── String+Extension
    │      ├── Int+Extension
    │      └── NSMutableAttributedString + Extesion
    ├── Assests
    ├── LaunchScreen
    └── BoxOfficeTests
          └── BoxOfficeTests
```

</details>
    
<br/>

## 4. 실행화면
|BoxOfficeList 페이지|MovieDetail페이지|CalendarView|
|:----:|:----:|:----:|
|<img src="https://i.imgur.com/JZXjcNx.gif" width = 140 /> |<img src = "https://i.imgur.com/RCm26Lw.gif" width = 140>|<img src = "https://i.imgur.com/CP5uwZ0.gif" width = 140>|
|해당 날짜의 BoxOffice데이터를 요청하여 응답받고, JSON파싱을 통해 가공된 데이터를 영화리스트 `collectionListView`형태로 띄워주고 있는 화면입니다.|BoxOfficeList페이지에서 각각의 셀을 클릭하여 `MovieDetailView`로 이동해 해당하는 영화의 이미지와 영화정보를 화면에 띄워주는 화면입니다.|우측상단 네비게이션바버튼을 이용해 날짜버튼을 클릭시 `calendarView`가 나오고 받아온 날짜데이터를 통해 BoxOfficeList를 다시 업데이트하는 화면입니다.| 

|Dynamic Type 적용|Present 방식|
|:----:|:----:|
|<img src="https://i.imgur.com/gY5xbLm.gif" width = 140 />|<img src="https://i.imgur.com/QdQqPMU.gif" width = 140 />|
|BoxOfficeList 페이지와, MovieDetail페이지에 Dynamic Type을 적용시켰켜 유연한 글자 크기를 구현했습니다.|BoxOfficeList 페이지에서 List 표현방식과, Icon 표현방식으로 설정할 수 있도록 화면을 구현하였습니다.|


</br>

## 5. 트러블 슈팅

<details>
    <summary><big>HTTP 접근을 허용시키는 방법</big></summary>

### :fire:HTTP 접근을 허용시켜주는 방법
>iOS 9 버전 이후부터 적용된 보안 정책으로, 보안에 취약한 네트워크를 차단시키기 때문에 아래와 같은 오류 메세지가 나왔습니다. 
>iOS 9 버전 이후부터 적용된 보안 정책은 ATS로 애플리케이션과 웹 서비스 사이에 통신에서 보안 향상을 위해 iOS 9.0부터 도입된 보안 정책으로, 보안이 취약한 네트워크를 차단하고, 모든 인터넷 통신 시 안전한 프로토콜을 사용하는 것을 보장한다고 합니다.

- 암호화 처리되지 않는 HTTP를 사용하여 네트워크 통신을 시도하면 아래와 같은 에러 로그를 띄우며 통신이 실패합니다.

<img width="956" alt="스크린샷 2023-03-21 오후 5 48 32" src="https://user-images.githubusercontent.com/88870642/226558255-f45f8cfc-85db-4f61-90a4-8f50c566ba6c.png">



- 해결방법
1. `info.plist`에 들어간다.
2. `Transport Security Settings`에 접근하여 `App Transport Security Settings`의 값을 `YES`로 바꾼다.
<img src= https://i.imgur.com/8QmPtiz.png>

    
</br> 
    
</details>
    
<details>
    <summary><big>URLSession의 completionHandler에서의 error, response, data의 순서</big></summary>    
    
### :fire: URLSession의 completionHandler에서 error, response, data의 순서
>코드의 순서가 `error`와 `response`를 먼저 처리하고 데이터를 사용하는 것이 올바른 순서입니다. 하지만 변경 전과 같이 `error`와 `response`가 `data` 밑에서 처리 될 경우 `error`와 `response`에서 에러가 날 경우 처리해줄 수 없었습니다. 그렇기 때문에 `error`, `response`, `data`의 순서를 수정하였습니다.

- 변경 전
```swift
 URLSession.shared.dataTask(with: request) { data, response, error in
            guard let validData = data else { return }
            guard let parsedData = parserType.Parse(data: validData) else {return}
            delegate?.fetchAPIData(data: parsedData)
            guard error != nil else { return }

            guard let httpURLResponse = response as? HTTPURLResponse, (200...299).contains(httpURLResponse.statusCode) else { return }
        }.resume()
```
- 변경 후
```swift
URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else { return }
            
            guard let httpURLResponse = response as? HTTPURLResponse, (200...299).contains(httpURLResponse.statusCode) else { return }
            
            guard let validData = data, let parsedData = parser.parse(data: validData) else { return }
            completion(parsedData)
        }.resume()
```
    
</details> 

<details>
    <summary><big>ViewController에 API로 불러온 데이터 전달방법</big></summary>  
    
### :fire:ViewController에 API로 불러온 데이터 전달하기
뷰컨트롤러에 API로 받아온 데이터를 전달하는 방법으로 처음에는 `delegate`패턴을 사용하여 뷰컨트롤러에 데이터를 전달하는 방법을 택했는데, `delegate`패턴이 불필요해보인다는 의견이있어서 `escaping Closure`를 사용하는 방법으로 변경했습니다. `delegate` 패턴 사용시 불필요한 전달용 매서드도 만들어야했고 코드도 불필요하게 길어지는게 단점으로 보였습니다.
```swift
func loadBoxOfficeAPI<T: Decodable>(urlAddress: String, parser: Parser<T>
                                    ,completion: @escaping (T) -> Void)

```
    
</details>       
    
<details>
    <summary><big>NSMutableArrtibutedString을 활용한 Label 부분색깔 적용</big></summary>  

### :fire: NSMutableAttributedString에서 색깔별 메서드 구현
- 한개의 Label에 여러 색의 글자를 넣기 위해 고민했고, 이를 해결하기 위해 `NSMutableAttributedString`을 `extension`하여 색깔별 메서드를 생성하였습니다.

- 초기 구현 형태
```swift
extension NSMutableAttributedString {
    func makeRedText(string: String) -> NSMutableAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.red]
        append(NSAttributedString(string: string, attributes: attributes))
        
        return self
    }
    
    func makeBlueText(string: String) -> NSMutableAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.blue]
        append(NSAttributedString(string: string, attributes: attributes))
        
        return self
    }
    
    func makeBlackText(string: String) -> NSMutableAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.black]
        append(NSAttributedString(string: string, attributes: attributes))
        
        return self
    }
}
```

- 수정된 구현 형태
    - 메서드를 하나로 통합하고 색을 매개변수로 받게끔 수정하여 리팩토링했습니다.

```swift
extension NSMutableAttributedString {
    func makeColorToText(string: String, color: UIColor) -> NSMutableAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [.foregroundColor: color]
        append(NSAttributedString(string: string, attributes: attributes))
        
        return self
    }
}
```
        
</details> 
    
<details>
    <summary><big>ModernCollectionView</big></summary>        

### :fire: Modern CollectionView

<img src = "https://i.imgur.com/14YUXZE.png">

<img src = "https://i.imgur.com/oMfahD4.png" width = 40%, height = 40% >

<br/>    
    
iOS 14.0부터 적용 가능한 Modern CollectionView를 사용하기 위해 위와같이 [ item - group - section ] 형식의 레이아웃을 적용했습니다.

```swift
setUpCompositionalLayout() -> UICollectionViewLayout {
    let layout = UICollectionViewCompositionalLayout {
        // item - group - section 
    }
    return layout
}
```
* 따라서 저희는 setUpCompositionalLayout 매서드가 UICollectionViewLayout을 반환하도록 매서드를 만들고 안에  [ item - group - section ] 형식으로 레이아웃을 구성했습니다

</details>    
    
<details>
    <summary><big>CollectionViewListCell - ios14.0 에러</big></summary>     
        
### :fire: CollectionViewListCell - ios14.0에러 

<img src = "https://i.imgur.com/rZuDfds.png" width = 40%, height = 40%>

* 위 화면과 같이 accessoryView를 추가하기위해서는 `tableview` 또는 일반 `collectionViewCell`이 아닌 `collectionViewListCell`이 필요했습니다.

<img src = "https://user-images.githubusercontent.com/88870642/228410171-743d365a-6332-46a0-bfc2-8fd9c5b4fc4f.png">

* 그런데 `collectionViewListCell`로 `boxOfficeListCell`을 사용하기 위해선 ios 14.0 업데이트가 필요하다는 에러가 나왔고, 이를 해결하기위해서 BoxOffice 프로젝트의 minimal Develoment를 ios 14.0으로 조정해주었습니다.

</details>  
    
<details>
    <summary><big>URLSession Network Layer 구현 Endpoint - Provider </big></summary>      
        
### :fire: URLSession Network Layer 구현
- URLSession을 사용하여 Endpoint와 Provider를 구현하기 위해 많은 코드적 실험을 했던것 같습니다.

#### 1. class를 이용한 Endpoint
    - class를 이용한 Endpoint 형태로 인스턴스 시 필요한 `baseURL`, `path`, `method`, `queryItems`를 초기화 해줘야 합니다. 
    - 아래 코드에서 볼 수 있듯이 초기화 시 코드의 가독성이 매우 떨어집니다.
    - 또한, Endpoint가 매우 범용적으로 사용되게 됩니다.
- class로 Endpoint를 구현한 형태
```swift
class EndPoint {
        var baseURL: BaseURL
        var path: Path
        var method: HTTPMethod
        var queryItems: [URLQueryItem]
        
    init(baseURL: BaseURL, path: Path, method: HTTPMethod, queryItems: [URLQueryItem]) {
        self.baseURL = baseURL
        self.path = path
        self.method = method
        self.queryItems = queryItems
    }
    ...
```
- 초기화 형태
```swift
let endpoint = EndPoint(baseURL: BaseURL.kobis,
                                path: Path.dailyBoxOffice,
                                method: HTTPMethod.get,
                                queryItems: [URLQueryItem(name: QueryItemsName.key.rawValue,
                                                          value: QueryItemsValue.keyValue.rawValue),
                                             URLQueryItem(name: QueryItemsName.targetDate.rawValue,
                                                          value: QueryItemsValue.targetDateValue.rawValue)])
```

#### 2. protocol를 이용한 Endpoint 
    - class로 Endpoint를 구현했을 때의 문제점을 해결하기 위해 protocol을 사용하는 방식으로 구현했습니다.
    - `EndpointMakeable`이라는 protocol을 만들어 각각의 Endpoint가 `EndpointMakeable`을 채택하는 식으로 구현하였습니다.

```swift
protocol EndpointMakeable {
    var baseURL: String { get }
    var path: String { get }
    var method: String { get }
    var queryItems: [URLQueryItem] { get }
    
    func makeURL() -> URL?
    func makeURLRequest() -> URLRequest?
}

extension EndpointMakeable {
    
    func makeURL() -> URL? {
        var urlComponents = URLComponents(string: baseURL)
        urlComponents?.path = path
        urlComponents?.queryItems = queryItems
        
        guard let url = urlComponents?.url else { return nil }
        
        return url
    }
    
    func makeURLRequest() -> URLRequest? {
        guard let url = makeURL() else { return nil }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method
        
        return urlRequest
    }
}
```
```swift
struct MovieDetailEndpoint: EndpointMakeable {
    var baseURL: String = "http://kobis.or.kr"
    var path: String = "/kobisopenapi/webservice/rest/movie/searchMovieInfo.json"
    var method: String = HTTPMethod.get.rawValue
    var queryItems: [URLQueryItem] = [URLQueryItem(name: "key", value: "f5eef3421c602c6cb7ea224104795888")]

```
</details>

<details>
    <summary><big>ViewController의 역할을 줄여주기 위해 Service 모델 구현 </big></summary>
    
    ### :fire: ViewController의 역할을 줄여주기 위해 `BoxOfficeService`와 `ImageSearchService` 클래스 구현
- URLSession을 통해 요청된 데이터를 ViewController에서 저장하지 않기 위해 `Service`라는 새로운 모델을 만들어줬습니다.
    
- 수정 전
    - `Service`라는 모델을 만들기 전에는 ViewController에 GET을 통해 받아온 데이터를 직접 저장했습니다.
    - ViewController에서 `Provider`의 메서드를 호출하여 데이터를 응답받고, ViewController 내부 프로퍼티에 저장하는 형태입니다.
```swift
final class BoxOfficeViewController: UIViewController {
    @IBOutlet weak var boxOfficeListCollectionView: UICollectionView!
    lazy var activityIndicator = UIActivityIndicatorView()

    private var dailyBoxOffice: DailyBoxOffice?
    private var provider = Provider()

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDailyBoxOfficeAPI()
        setUpView()
    }

    private func fetchDailyBoxOfficeAPI() {
        var dailyBoxOfficeEndpoint = DailyBoxOfficeEndpoint()
        dailyBoxOfficeEndpoint.insertDateQueryValue(date: "20230327")

        provider.loadBoxOfficeAPI(endpoint: dailyBoxOfficeEndpoint,
                                  parser: Parser<DailyBoxOffice>()) { parsedData in
            self.dailyBoxOffice = parsedData

            DispatchQueue.main.async {
                self.boxOfficeListCollectionView.reloadData()
                self.activityIndicator.stopAnimating()
            }
        }
    }
}
```

- 수정 후  
     - `Service`모델을 만든 이후에는 ViewController에서 `Service`모델을 통해 데이터를 불러오는 방식으로 변경되었습니다. 
```swift
// Service
class BoxOfficeService {
    let provider = Provider()
    var dailyBoxOffice: DailyBoxOffice?
    var movieDetail: MovieDetail?
    var movieCode = ""
    
    func fetchDailyBoxOfficeAPI(date: String,completion: @escaping () -> Void) {
        var dailyBoxOfficeEndpoint = DailyBoxOfficeEndpoint()
        dailyBoxOfficeEndpoint.insertDateQueryValue(date: date)
        
        provider.loadBoxOfficeAPI(endpoint: dailyBoxOfficeEndpoint,
                                  parser: Parser<DailyBoxOffice>()) { parsedData in
            self.dailyBoxOffice = parsedData
            completion()
        }
    }
    ...
}
    
// ViewController
final class BoxOfficeViewController: UIViewController {
    @IBOutlet weak var boxOfficeListCollectionView: UICollectionView!
    lazy var activityIndicator = UIActivityIndicatorView()
    let boxOfficeService = BoxOfficeService()
    private var provider = Provider()

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDailyBoxOffice()
        setUpView()
    }

    private func fetchDailyBoxOffice() {
        boxOfficeService.fetchDailyBoxOfficeAPI() {
            DispatchQueue.main.async {
                self.boxOfficeListCollectionView.reloadData()
                self.activityIndicator.stopAnimating()
```
 
</details>
    
<details>
    <summary><big>URLCache 잔존기한 설정 및 정책 설정 </big></summary>    
    
### :fire:URLCache 잔존기한 설정 - removeAllCachedResponses
* URLCache 잔존기한 설정을 `removeAllCachedResponses()` 매서드를 활용해서 **2가지 조건** 을 통해 구현하고자했습니다.
    * 1. viewDidLoad에 아래 `removeCacheAfter30min()`매서드를 구현해 30분간 캐시데이터가 잔존할 수 있도록하며 이후에 캐시데이터를 삭제시키는 조건입니다.
    * 2. appdelegate - applicationWillTerminate() `removeCache()`매서드를 구현해 앱이 종료되는 시점에 캐시데이터를 삭제시키는 조건입니다.

    
```swift
//viewDidLoad
 func removeCacheAfter30min() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1800) {
            URLCache.shared.removeAllCachedResponses()
            print("캐시 지워짐")
    }
}
```

```swift!
//Appdelegate - applicationWillTerminate()
 func removeCache() {
        DispatchQueue.main.async() {
            URLCache.shared.removeAllCachedResponses()
            print("캐시 지워짐")
    }
}
```
* (문제점) 앱이 실행된 이후에 시간을 갖고 캐시데이터를 삭제시키는 매서드는 정상적으로 구현되는 반면에 앱이 종료되는 시점에 캐시데이터를 삭제시키는 매서드는 정상작동되지않았습니다. `applicationWillterminate()`매서드는 정상적으로 동작하는데 내부에 `removeCache`가 작동되지않았고 이를 해결하지 못했습니다.

### :fire: URLCache 정책
* URLCache의 4가지 정책중 `urlRequest.cachePolicy = .returnCacheDataElseLoad` 정책을 선택해서 캐시데이터가 있을때는 네트워킹을 허용하지않고 캐시데이터가 없을때만 네트워킹을 하도록 정책을 선택했습니다.
* 또 `storagePolicy = .allowedInMemoryOnly`로 설정함으로써 메모리에 저장하게끔 설정해 앱이 실행종료되면 메모리캐싱 특성상 캐싱데이터가 날아게끔 설정했는데 이 또한 정상작동되지 않았습니다.
    
</details>
    

    
<details>
<summary><big>ModernCollectionView cell size 설정 </big></summary> 
    
### :fire:Modern CollectionView 구현 방식
    
|변경 전|변경 후 |
|:----:|:----:|
|<img src = "https://i.imgur.com/WEMwELq.png" width = 70%>|<img src="https://i.imgur.com/lmdynHb.png" width = 70% />|

#### 변경 전 - NSCollectionLayoutSize로 cell - group의 사이즈를 잡아주는 상태
* 전체적인 Cell(item)의 크기를 잡아주어 Dynamic Type을 사용할 때, Cell의 크기가 변하지 않는 문제점 발생합니다.
```swift
  private func setUpCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout {
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
            
            let groupHeight =  NSCollectionLayoutDimension.fractionalWidth(1/4)
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: groupHeight)
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
            let section = NSCollectionLayoutSection(group: group)
            
            return section
        }
        return layout
    }
```
    

#### 변경 후 - UICollectionViewCompositionalLayout.list()매서드 사용
* ModernCollectionView의 Layout 중에 list라는 메서드를 사용하면 테이블뷰 형태로 생성이 가능합니다.
* Cell들 내부 요소의 크기만큼 Cell의 크기가 정해지기 때문에 Dynamic Type을 사용하여도 문제가 생기지 않습니다.
    
```swift
private func setUpCompositionalListLayout() -> UICollectionViewLayout {
        let configuration = UICollectionLayoutListConfiguration(appearance: .plain)
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        
        return layout
    }
```
</details> 
    
<details>
<summary><big> CollectionView에서 선택가능한 날짜 범위설정 </big></summary> 

### :fire: CalendarView에서 선택 가능한 날짜 범위 생성
* availableDateRange라는 프로퍼티를 통해 선택 가능 날짜를 구현해주었습니다.
* 그 과정 속에서 어제의 날짜를 가져오기 위해 `Date(timeIntervalSinceNow: -86400)`를 사용해서 어제의 날짜를 적용시켰습니다.
```swift
self.availableDateRange = DateInterval(start: Date(timeIntervalSinceReferenceDate: 0), end: Date(timeIntervalSinceNow: -86400))
```
    
</details>
    
    
## 6. Reference
- [Swift Language Guide - URLSession](https://developer.apple.com/documentation/foundation/urlsession)
- [Swift Language Guide - Fetching Website Data into Memory](https://developer.apple.com/documentation/foundation/url_loading_system/fetching_website_data_into_memory)
- [Swift Document - ModernCollectionView](https://developer.apple.com/documentation/uikit/views_and_controls/collection_views/implementing_modern_collection_views)
- [Swift Document - Lists in UICollectionView](https://developer.apple.com/videos/play/wwdc2020/10026) 
- [Swift 김종권님 블로그 - NetWorkLyer - Endpoint, Provier 설계](https://ios-development.tistory.com/719)

    

## 7. 팀 회고
    - 우리팀이 잘한 점
        - 서로의 피드백과 의견수용이 빨라서 생각을 잘 조율하면서 프로젝트를 진행할 수 있었습니다.
    - 우리팀의 아쉬웠던 점
        - 프로젝트 진행시간이 일정하지 않았습니다.
        - 생소한 개념이 많아서 진행이 더디다보니 프로젝트를 완료하지 못해서 아쉬웠습니다.


