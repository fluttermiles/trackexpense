 import 'package:trackexpense/utils/utils.dart';

class CurrencySearchModal extends StatefulWidget {
  final Map<String, dynamic> currencyCountryMap;

  const CurrencySearchModal({
    super.key,
    required this.currencyCountryMap,
  });

  @override
  State<CurrencySearchModal> createState() => _CurrencySearchModalState();
}

class _CurrencySearchModalState extends State<CurrencySearchModal> {
  late TextEditingController searchController;
  late List<String> allCurrencyCodes;
  late List<String> filteredCodes;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    // All the currency codes from the map (e.g., ["AFN", "ALL", "DZD", ...])
    allCurrencyCodes = widget.currencyCountryMap.keys.toList();
    // Sort them alphabetically if desired
    allCurrencyCodes.sort();

    // Initially, show them all
    filteredCodes = List.from(allCurrencyCodes);

    // Listen to search changes
    searchController.addListener(onSearchChanged);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void onSearchChanged() {
    final query = searchController.text.trim().toLowerCase();
    if (query.isEmpty) {
      // Show all if the search is empty
      setState(() {
        filteredCodes = List.from(allCurrencyCodes);
      });
      return;
    }

    // Filter by code or country name
    setState(() {
      filteredCodes = allCurrencyCodes.where((code) {
        final data = widget.currencyCountryMap[code];
        final country = data["country"]?.toString().toLowerCase() ?? '';
        return code.toLowerCase().contains(query) || country.contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Use safe area to avoid bottom notches, etc.
    return SafeArea(
      child: Container(
        color: Colors.black,
        // Make it visually large enough. You could also wrap with Expanded if needed.
        height: MediaQuery.of(context).size.height * 0.6,
        child: Column(
          children: [
            // Search bar
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: searchController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Search currency or country...",
                  hintStyle: const TextStyle(color: Colors.white54),
                  prefixIcon: const Icon(Icons.search, color: Colors.white54),
                  filled: true,
                  fillColor: Colors.grey.shade900,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            // List of currencies
            Expanded(
              child: ListView.separated(
                itemCount: filteredCodes.length,
                separatorBuilder: (context, index) => const Divider(
                  height: 1,
                  color: Colors.white10,
                ),
                itemBuilder: (context, index) {
                  final code = filteredCodes[index];
                  final country = widget.currencyCountryMap[code]?["country"] ?? "";
                  final symbol = widget.currencyCountryMap[code]?["symbol"] ?? "";
                  return ListTile(
                    title: Text(
                      "$code $symbol", // Display code and symbol together
                      style: const TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      country.toString(),
                      style: const TextStyle(color: Colors.white70),
                    ),
                    onTap: () {
                      Navigator.pop(context, code); // return the selected code
                    },
                    tileColor: Colors.black,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
