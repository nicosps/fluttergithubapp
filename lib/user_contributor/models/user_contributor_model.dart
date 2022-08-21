import 'dart:convert';

List<UserContributorModel> userContributorModelFromJson(String str) =>
    List<UserContributorModel>.from(
      json.decode(str).map(
            (x) => UserContributorModel.fromJson(x),
          ),
    );

String userContributorModelToJson(List<UserContributorModel> data) =>
    json.encode(
      List<dynamic>.from(data.map((x) => x.toJson())),
    );

class UserContributorModel {
  UserContributorModel({
    this.login = "",
    this.id = 0,
    this.nodeId = "",
    this.avatarUrl = "",
    this.gravatarId = "",
    this.url = "",
    this.htmlUrl = "",
    this.followersUrl = "",
    this.followingUrl = "",
    this.gistsUrl = "",
    this.starredUrl = "",
    this.subscriptionsUrl = "",
    this.organizationsUrl = "",
    this.reposUrl = "",
    this.eventsUrl = "",
    this.receivedEventsUrl = "",
    this.type = "",
    this.siteAdmin = false,
    this.contributions = 0,
  });

  String login;
  int id;
  String nodeId;
  String avatarUrl;
  String gravatarId;
  String url;
  String htmlUrl;
  String followersUrl;
  String followingUrl;
  String gistsUrl;
  String starredUrl;
  String subscriptionsUrl;
  String organizationsUrl;
  String reposUrl;
  String eventsUrl;
  String receivedEventsUrl;
  String type;
  bool siteAdmin;
  int contributions;

  factory UserContributorModel.fromJson(Map<String, dynamic> json) =>
      UserContributorModel(
        login: json["login"],
        id: json["id"],
        nodeId: json["node_id"],
        avatarUrl: json["avatar_url"],
        gravatarId: json["gravatar_id"],
        url: json["url"],
        htmlUrl: json["html_url"],
        followersUrl: json["followers_url"],
        followingUrl: json["following_url"],
        gistsUrl: json["gists_url"],
        starredUrl: json["starred_url"],
        subscriptionsUrl: json["subscriptions_url"],
        organizationsUrl: json["organizations_url"],
        reposUrl: json["repos_url"],
        eventsUrl: json["events_url"],
        receivedEventsUrl: json["received_events_url"],
        type: json["type"],
        siteAdmin: json["site_admin"],
        contributions: json["contributions"],
      );

  Map<String, dynamic> toJson() => {
        "login": login,
        "id": id,
        "node_id": nodeId,
        "avatar_url": avatarUrl,
        "gravatar_id": gravatarId,
        "url": url,
        "html_url": htmlUrl,
        "followers_url": followersUrl,
        "following_url": followingUrl,
        "gists_url": gistsUrl,
        "starred_url": starredUrl,
        "subscriptions_url": subscriptionsUrl,
        "organizations_url": organizationsUrl,
        "repos_url": reposUrl,
        "events_url": eventsUrl,
        "received_events_url": receivedEventsUrl,
        "type": type,
        "site_admin": siteAdmin,
        "contributions": contributions,
      };
}
