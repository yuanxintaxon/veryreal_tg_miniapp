// To parse this JSON data, do
//
//     final groupChatbotConfig = groupChatbotConfigFromJson(jsonString);

import 'dart:convert';

GroupChatbotConfig groupChatbotConfigFromJson(String str) => GroupChatbotConfig.fromJson(json.decode(str));

String groupChatbotConfigToJson(GroupChatbotConfig data) => json.encode(data.toJson());

class GroupChatbotConfig {
    int? minAiUsers;
    int? maxAiUsers;
    int? defaultAiUsers;
    int? minAiPeriodMins;
    int? maxAiPeriodMins;
    int? defaultAiPeriodMins;

    GroupChatbotConfig({
        this.minAiUsers,
        this.maxAiUsers,
        this.defaultAiUsers,
        this.minAiPeriodMins,
        this.maxAiPeriodMins,
        this.defaultAiPeriodMins,
    });

    factory GroupChatbotConfig.fromJson(Map<String, dynamic> json) => GroupChatbotConfig(
        minAiUsers: json["minAIUsers"],
        maxAiUsers: json["maxAIUsers"],
        defaultAiUsers: json["defaultAIUsers"],
        minAiPeriodMins: json["minAIPeriodMins"],
        maxAiPeriodMins: json["maxAIPeriodMins"],
        defaultAiPeriodMins: json["defaultAIPeriodMins"],
    );

    Map<String, dynamic> toJson() => {
        "minAIUsers": minAiUsers,
        "maxAIUsers": maxAiUsers,
        "defaultAIUsers": defaultAiUsers,
        "minAIPeriodMins": minAiPeriodMins,
        "maxAIPeriodMins": maxAiPeriodMins,
        "defaultAIPeriodMins": defaultAiPeriodMins,
    };
}
