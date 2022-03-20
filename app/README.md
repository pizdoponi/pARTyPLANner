# Project Structure

* [/lib/src/config](lib/src/config): Configuration of the app — routes, colors, theme, etc.
* [/lib/src/core](lib/src/core): Here is the core functionality of the app. What is used through all of the app belongs here. Eg. [Party](lib/src/core/entities/party.dart) entity is used in the entire app => is located in core folder.
* [/lib/src/features](lib/src/features): "Pages/Tabs" (features) in the app — home, friends, search, etc.

## Structure for Features

* data: Low level part of the app concerning itself with providing the domain layer with requested data in appropriate form.

  * models: Models extend entities. They contain additional fields and logic needed to operate with db.
  * sources: Where the data is fetched from. Seperated in **remote** and **local** data sources.
  * repositories: The brain of the data layer. Holds the implementation of the repository contracts defined in *domain/repositories*. All of the filtering/selection/optimization is performed here and then propagated to the domain layer.

<br>

* domain: Business logic of the app resides here. It is a bridge between the user and the data.

  * entities: The core business objects. They are at the very core of the architecture. They are entirely independent and are very rarely subject to change. They the first thing impplemented in any feature.
  * usecases: The use cases we provide to the user in our app. Each use case should do one specific thing and one thing only. It is the functionality the user would need.
  * repositories: The contracts the repositories in the data layer must adhere to. They are made abstract, so as not to be dependent on the concrete implementation of them. This way we can achieve seperation of concerns and make our code more stable.

<br>

* presentation: How we present the data to the user and provide him with a way to interact with the app.

  * widgets: Self-contaning components/widgets. They are building blocks to making complex ui. Think of each widget as a lego brick. Each one represents a part of a whole you obtain by combining it with other bricks.
  * screens: What the user sees. They are composed of multiple widgets.
  * providers: State managment tool. For every event (user action) there should be a state emerging from it => for every action the user makes in the app, there should be a **reaction**, some kind of a change(new state). Riverpod (a.k.a providers) allow us to easily manage said states.

# Branches

* **main**: The production code. Should only be merged with other branches when the code is thoroughly tested and ready to be used in production
* **dev**: Used for development. Other feature brenches are merged to this one when they are done. Changes in [core](lib/src/core/) and [config](lib/src/config/) are performed here.
* **featureX**: Each feature has its own branch.

# Useful Links

* Clean Architecture: https://youtube.com/playlist?list=PLB6lc7nQ1n4iYGE_khpXRdJkJEp9WOech
* Anotha Clean Article: https://devmuaz.medium.com/flutter-clean-architecture-series-part-1-d2d4c2e75c47
* Effective dart (syntax, conventions, doc comments, etc.): https://dart.dev/guides/language/effective-dart