# Essential Feed App – Image Feed Feature

## BDD Specs

### Story: Customer requests to see their image feed

### Narrative #1

```
As an online customer
I want the app to automatically load my latest image feed
So I can always enjoy the newest images of my friends
```

#### Scenarios (Acceptance criteria)

```
Given the customer has connectivity
 When the customer requests to see their feed
 Then the app should display the latest feed from remote
  And replace the cache with the new feed
```

### Narrative #2

```
As an offline customer
I want the app to show the latest saved version of my image feed
So I can always enjoy images of my friends
```

#### Scenarios (Acceptance criteria)

```
Given the customer doesn't have connectivity
  And there’s a cached version of the feed
  And the cache is less than seven days old
 When the customer requests to see the feed
 Then the app should display the latest feed saved

Given the customer doesn't have connectivity
  And there’s a cached version of the feed
  And the cache is seven days old or more
 When the customer requests to see the feed
 Then the app should display an error message

Given the customer doesn't have connectivity
  And the cache is empty
 When the customer requests to see the feed
 Then the app should display an error message
```

## Use Cases

### Load Feed From Remote Use Case

#### Data:
- URL

#### Primary course (happy path):
1. Execute "Load Image Feed" command with above data.
2. System downloads data from the URL.
3. System validates downloaded data.
4. System creates image feed from valid data.
5. System delivers image feed.

#### Invalid data – error course (sad path):
1. System delivers invalid data error.

#### No connectivity – error course (sad path):
1. System delivers connectivity error.

---

### Load Feed Image Data From Remote Use Case

#### Data:
- URL

#### Primary course (happy path):
1. Execute "Load Image Data" command with above data.
2. System downloads data from the URL.
3. System validates downloaded data.
4. System delivers image data.

#### Cancel course:
1. System does not deliver image data nor error.

#### Invalid data – error course (sad path):
1. System delivers invalid data error.

#### No connectivity – error course (sad path):
1. System delivers connectivity error.

---


### Load Feed From Cache Use Case

#### Primary course:
1. Execute "Load Image Feed" command with above data.
2. System retrieves feed data from cache.
3. System validates cache is less than seven days old.
4. System creates image feed from cached data.
5. System delivers image feed.

#### Retrieval error course (sad path):
1. System delivers error.

#### Expired cache course (sad path): 
1. System delivers no feed images.

#### Empty cache course (sad path): 
1. System delivers no feed images.

---

### Load Feed Image Data From Cache Use Case

#### Data:
- URL

#### Primary course (happy path):
1. Execute "Load Image Data" command with above data.
2. System retrieves data from the cache.
3. System delivers cached image data.

#### Cancel course:
1. System does not deliver image data nor error.

#### Retrieval error course (sad path):
1. System delivers error.

#### Empty cache course (sad path):
1. System delivers not found error.

---

### Validate Feed Cache Use Case

#### Primary course:
1. Execute "Validate Cache" command with above data.
2. System retrieves feed data from cache.
3. System validates cache is less than seven days old.

#### Retrieval error course (sad path):
1. System deletes cache.

#### Expired cache course (sad path): 
1. System deletes cache

---

### Cache Feed Use Case

#### Data:
- Image Feed

#### Primary course (happy path):
1. Execute "Save Image Feed" command with above data.
2. System deletes old cache data.
3. System encodes image feed.
4. System timestamps the new cache.
5. System saves new cache data.
6. System delivers success message.

#### Deleting error course (sad path):
1. System delivers error.

#### Saving error course (sad path):
1. System delivers error.

---

## Flowchart

![Feed Loading Feature](feed_flowchart.png)

## Architecture

![Feed Loading Feature](feed_architecture.png)

## Model Specs

### Feed Image

| Property      | Type                |
|---------------|---------------------|
| `id`          | `UUID`              |
| `description` | `String` (optional) |
| `location`    | `String` (optional) |
| `url`	        | `URL`               |

### Payload contract

```
GET *url* (TBD)

200 RESPONSE

{
	"items": [
		{
			"id": "a UUID",
			"description": "a description",
			"location": "a location",
			"image": "https://a-image.url",
		},
		{
			"id": "another UUID",
			"description": "another description",
			"image": "https://another-image.url"
		},
		{
			"id": "even another UUID",
			"location": "even another location",
			"image": "https://even-another-image.url"
		},
		{
			"id": "yet another UUID",
			"image": "https://yet-another-image.url"
		}
		...
	]
}
```



VIDEO: Randomizing & Parallelizing Tests, Code Coverage, Testing in Integration with the Backend, and Automating a Continuous Integration (CI) Pipeline

commit `Enable random test execution order to guarantee there is no order dependency between test methods` - follow video to see changes for this commit

commit `Enable code coverage gathering` - follow video to see changes for this commit

commit `Add CI scheme` - follow video to see changes for this commit

commit `Add Travis CI config` - follow video to see changes for this commit

commit `Add CI build status badge` - follow video to see changes for this commit

commit `Delete the CodableFeedStore in favor of the CoreDataFeedStore (we just need one in this project). If needed, of course, we can revert this commit and restore the `Codable` implementation.` - not actually deleted because I want to keep the code in repo

commit `Include EssentialFeedCacheIntegrationTests test target in the CI scheme to guarantee we build and run all cache integration tests as part of the continuous integration pipeline.` - do not yet actually have a CI scheme. No need for it right now.

VIDEO:  Improving Model Composability With Swift’s Standard Result and Optional Types, Map, Functors, and Powerful Refactorings Backed by Tests and Types (Compiler!)

commit `Migrate to Swift 5 (no source changes needed!)` - watch video. Likelly nothing to do here.

commit `Enable Base Internationalization (a recommended setting in the Xcode 10.2.1)` - watch video.

VIDEO: Gathering Fast Feedback and Validating UI Design and Dev Decisions Through Realistic App Prototypes

commit `Add empty project for prototype` - watch video

commit `Add prototype storyboard with table view and feed cell layout` - watch video

commit `Add FeedViewController rendering 10 cells` - watch video

commit `Add prototype feed data for demoing purposes` - watch video

commit `Add FeedImageCell with storyboard connections` - watch video

commit `Render prototype feed data on the table view` - watch video

commit `Add fade-in animation to simulate "asynchronous image loading"` - watch video

commit `Add app icon` - watch video

VIDEO: Supporting Multiple Platforms with Swift Frameworks While Separating Platform-specific Components to Facilitate Loose Coupling and Speed up Development

commit `Make EssentialFeedAPIEndToEndTests target support macOS and iOS since it's platform-independent (can run on any platform!)`  -already done on previous commit

commit `Make `EssentialFeedCacheIntegrationTests` target support macOS and iOS since it's platform-independent (can run on any platform!)`  -already done on previous commit

commit `Add separate CI schemes for macOS and iOS as we now have an iOS-specific target that should not be tested on macOS`  -not relevant right now as I do not have a CI scheme.

VIDEO: Apple MVC, Test-driving UIViewControllers, Dealing with UIKit’s Inversion of Control & Temporal Coupling, and Decoupling Tests from UI Implementation Details

commit `Add UIRefreshControl to prototype to simulate async loading of the feed` - Prototype not beeing done here as I deem it not important and can be done later by fallowing the relevant video.

commit `Add shimmering animation while loading image in the prototype app` - Prototype not beeing done here as I deem it not important and can be done later by fallowing the relevant video. Shimmering code is here though: 

####
private extension UIView {
	private var shimmerAnimationKey: String {
		return "shimmer"
	}

	func startShimmering() {
		let white = UIColor.white.cgColor
		let alpha = UIColor.white.withAlphaComponent(0.7).cgColor
		let width = bounds.width
		let height = bounds.height

		let gradient = CAGradientLayer()
		gradient.colors = [alpha, white, alpha]
		gradient.startPoint = CGPoint(x: 0.0, y: 0.4)
		gradient.endPoint = CGPoint(x: 1.0, y: 0.6)
		gradient.locations = [0.4, 0.5, 0.6]
		gradient.frame = CGRect(x: -width, y: 0, width: width*3, height: height)
		layer.mask = gradient

		let animation = CABasicAnimation(keyPath: #keyPath(CAGradientLayer.locations))
		animation.fromValue = [0.0, 0.1, 0.2]
		animation.toValue = [0.8, 0.9, 1.0]
		animation.duration = 1
		animation.repeatCount = .infinity
		gradient.add(animation, forKey: shimmerAnimationKey)
	}

	func stopShimmering() {
		layer.mask = nil
	}
}
####

VIDEO: Composite Pattern: Implementing a Flexible & Composable Strategy for Loading Data with Fallback Logic

commit `Remove unused test case` - nothing to do here.

