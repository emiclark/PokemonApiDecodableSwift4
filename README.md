# PokemonApiDecodableSwift4

Use Pokemon API and populate a tableview using storyboard, parsing son using Swift 4 decodable

1. Create Pokemon class that conforms to the Decodable protocol.
2. Make initial api call to download pokemon data asynchronously.
3. Create Pokemon objects using JSONDecodable().
4. Get the 'next', 'previous' values in the mainJson to download the next set of Pokemon data.
5. Populate the Pokemon name and sprite image in the tableview with json returned from the api call.
6. Download images for the tableViewCell asyncronously.
7. Implement an image cache so that images are downloaded only once. There is a check to see if the sprite image is cached. If so, then the cached image is used, otherwise it is downloaded then added to the cache.
8. Indicator view was added and starts to animate when the data is downloaded and stops when the information has completeed downloading.
9. A final check is implemented so that the sprite image appears in the correct tableview cell only if it is visible.
