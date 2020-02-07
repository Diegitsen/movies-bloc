import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/item_model.dart';

class MoviesBloc {
  final _repository = Repository();
  final _moviesFetcher = PublishSubject<ItemModel>();

  Observable<ItemModel> get allMovies => _moviesFetcher.stream;

  fetchAllMovies() async {
    ItemModel itemModel = await _repository.fetchAllMovies();
    _moviesFetcher.sink.add(itemModel);
  }

  dispose() {
    _moviesFetcher.close();
  }
}

//with this, we are giving access to a single instance of MovieBloc class to the UI screen
final bloc = MoviesBloc();

//PublishingSubjective = get the network data, fetch that data in the model ItemModel and pass it
//to the UI screen as a stream

//to pass the itemModel as a stream we hace created a method call allMovies() whose return an Observable