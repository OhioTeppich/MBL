abstract class Filter {
  const Filter({required this.label});

  final String label;
}

class FilterSlider extends Filter {
  const FilterSlider({required this.value, required super.label});
  final int value;
}

class FilterCheckbox extends Filter {
  const FilterCheckbox({required this.value, required super.label});
  final bool value;
}

/*
Filter Widget (Popup/Modal)
  -> expects List of filters and the length of the content element list
  -> generates Checkbox or Slider Filter based on provided filters
  -> each time a filter value changes the applyFilterCallback needs to be called
  -> shows the length of content element list but only if
    -> filters are applied
    -> filters have changed after the user has opened the Filter Modal

FilterSettings (passed to CollectionHeader and forwarded to Filter)
  -> applyFilterCallback
    -> runs a new Event applyFilterEvent 
    -> payload of the event is the list of filters
    -> event is fired when the user hits apply filters
  -> resultAmount
    -> length of content elements list 

Apply Filter Event
  -> set loading status
  -> updates list of filters
  -> set page to 1
  -> clears list of content elements in state
  -> event to get content elements is triggered (payload is filters)
  -> set success or error state

Service GetContentElement
  -> utilizes a class to generate url parmeters based of the filters the user has set (if any filters are set) 
*/
class SomeState {
  SomeState();

  final List<Filter> filters = const [
    FilterSlider(value: 0, label: 'Length'),
    FilterCheckbox(value: false, label: 'Watched'),
    FilterCheckbox(value: false, label: 'Ball Class'),
    FilterCheckbox(value: false, label: 'Weigth Class'),
  ];
}
