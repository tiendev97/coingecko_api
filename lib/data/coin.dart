import 'package:coingecko_api/data/coin_community_data.dart';
import 'package:coingecko_api/data/coin_developer_data.dart';
import 'package:coingecko_api/data/coin_market_data.dart';
import 'package:coingecko_api/data/coin_links.dart';
import 'package:coingecko_api/data/coin_public_interests_stats.dart';
import 'package:coingecko_api/data/ticker.dart';
import 'package:coingecko_api/data/image_info.dart';
import 'package:coingecko_api/data/status_update.dart';
import 'package:coingecko_api/data/localized_string.dart';
import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// Coin data wrapper
class Coin {
  /// Coin identifier
  final String id;

  /// Coin symbol
  final String symbol;

  /// Coin name
  final String name;

  /// Coin asset platform identifier
  final String? assetPlatformId;

  /// Platforms on which the coin is presented
  final Map<String, String>? platforms;

  /// Block time (minutes)
  final double blockTimeInMinutes;

  /// Hashing algorithm
  final String hashingAlgorithm;

  /// Categories in which the coin is presented.
  final List<String> categories;

  /// Public notice
  final String publicNotice;

  /// Additional notices
  final List<String>? additionalNotices;

  /// Coin name in different localizations
  final LocalizedString? localization;

  /// Coin description in different localizations
  final LocalizedString? description;

  /// Coin related link information
  final CoinLinks? links;

  /// Coin image
  final ImageInfo? image;

  /// Country of origin of the coin
  final String? countryOrigin;

  /// Genesis date of the coin
  final DateTime? genesisDate;

  /// Contract address of the coin
  final String? contractAddress;

  /// Percentage of positive votes
  final double? sentimentVotesUpPercentage;

  /// Percentage of negative votes
  final double? sentimentVotesDownPercentage;

  /// Rank of market capitalization
  final int? marketCapRank;

  /// CoinGecko rank
  final int? coingeckoRank;

  /// CoinGecko score
  final double? coingeckoScore;

  /// Developer score
  final double? developerScore;

  /// Community score
  final double? communityScore;

  /// Liquidity score
  final double? liquidityScore;

  /// Public interests score
  final double? publicInterestScore;

  /// Coin market data
  final CoinMarketData? marketData;

  /// Community data
  final CoinCommunityData? communityData;

  /// Developer data
  final CoinDeveloperData? developerData;

  /// Public interest stats
  final CoinPublicInterestsStats? publicInterestStats;

  /// Status updates
  final List<StatusUpdate>? statusUpdates;

  /// The moment at which the data was updated
  final DateTime? lastUpdated;

  /// List of tickers
  final List<Ticker>? tickers;

  static List<StatusUpdate>? _parseStatusUpdates(dynamic json) {
    final jsonList = Convert.toList(json);
    return jsonList != null
        ? jsonList.map((e) => StatusUpdate.fromJson(e)).toList()
        : null;
  }

  static List<Ticker>? _parseTickers(dynamic json) {
    final jsonList = Convert.toList(json);
    return jsonList != null
        ? jsonList.map((e) => Ticker.fromJson(e)).toList()
        : null;
  }

  Coin.fromJson(Map<String, dynamic> json)
      : this.id = Convert.toNotNullableString(json['id'], ''),
        this.symbol = Convert.toNotNullableString(json['symbol'], ''),
        this.name = Convert.toNotNullableString(json['name'], ''),
        this.assetPlatformId =
            Convert.toNullableString(json['asset_platform_id']),
        this.platforms = Helpers.parseMapStringString(json['platforms']),
        this.blockTimeInMinutes =
            Convert.toDouble(json['block_time_in_minutes']) ?? 0,
        this.hashingAlgorithm =
            Convert.toNotNullableString(json['hashing_algorithm'], ''),
        this.categories = Helpers.parseListString(json['categories']),
        this.publicNotice =
            Convert.toNotNullableString(json['public_notice'], ''),
        this.additionalNotices =
            Helpers.parseListString(json['additional_notices']),
        this.localization = json.containsKey('localization')
            ? LocalizedString.fromJson(json['localization'])
            : null,
        this.description = json.containsKey('description')
            ? LocalizedString.fromJson(json['description'])
            : null,
        this.links = json.containsKey('links')
            ? CoinLinks.fromJson(json['links'])
            : null,
        this.image = json.containsKey('image')
            ? ImageInfo.fromJson(json['image'])
            : null,
        this.countryOrigin = Convert.toNullableString(json['country_origin']),
        this.genesisDate = Convert.toDateTime(json['genesis_date']),
        this.contractAddress =
            Convert.toNullableString(json['contract_address']),
        this.sentimentVotesUpPercentage =
            Convert.toDouble(json['sentiment_votes_up_percentage']),
        this.sentimentVotesDownPercentage =
            Convert.toDouble(json['sentiment_votes_down_percentage']),
        this.marketCapRank = Convert.toInt(json['market_cap_rank']),
        this.coingeckoRank = Convert.toInt(json['coingecko_rank']),
        this.coingeckoScore = Convert.toDouble(json['coingecko_score']),
        this.developerScore = Convert.toDouble(json['developer_score']),
        this.communityScore = Convert.toDouble(json['community_score']),
        this.liquidityScore = Convert.toDouble(json['liquidity_score']),
        this.publicInterestScore =
            Convert.toDouble(json['public_interest_score']),
        this.marketData = json.containsKey('market_data')
            ? CoinMarketData.fromJson(json['market_data'])
            : null,
        this.communityData = json.containsKey('community_data')
            ? CoinCommunityData.fromJson(json['community_data'])
            : null,
        this.developerData = json.containsKey('developer_data')
            ? CoinDeveloperData.fromJson(json['developer_data'])
            : null,
        this.publicInterestStats = json.containsKey('public_interest_stats')
            ? CoinPublicInterestsStats.fromJson(json['public_interest_stats'])
            : null,
        this.statusUpdates = _parseStatusUpdates(json['status_updates']),
        this.lastUpdated = Convert.toDateTime(json['last_updated']),
        this.tickers = _parseTickers(json['tickers']) {}

  @override
  String toString() {
    return '${Helpers.getTypeName(Coin)}: id = $id, symbol = $symbol, name = $name';
  }
}
