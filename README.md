# PokemonApiDecodableSwift4
Use Pokemon API and populate a tableview using storyboard, parsing son using Swift 4 decodable
1. Create Pokemon class and make them conform to the Decodable protocol.
2. Make api call to download pokemon data asynchronously.
3. Create Pokemon objects using JSONDecodable().
4. Get the 'next' and 'previous' values in the mainJson to download the next set of Pokemon data.
5. Populate tableview with json returned from the api call.
6. Implement scrolling tableview by tracking the tableviewcell, calling the api to download more data when end of the tableview is reached.
