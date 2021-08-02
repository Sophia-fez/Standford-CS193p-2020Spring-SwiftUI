//
//  Feed.swift
//  DouYin
//
//  Created by Sophia_fez on 2020/10/15.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let feed = try Feed(json)

import Foundation

// MARK: - Feed
struct Feed: Codable {
    let statusCode, minCursor, maxCursor, hasMore: Int?
    let awemeList: [AwemeList]?
    let homeModel, refreshClear: Int?
    let extra: Extra?
    let logPb: LogPb?
    let preloadAds: [JSONAny]?

    enum CodingKeys: String, CodingKey {
        case statusCode = "status_code"
        case minCursor = "min_cursor"
        case maxCursor = "max_cursor"
        case hasMore = "has_more"
        case awemeList = "aweme_list"
        case homeModel = "home_model"
        case refreshClear = "refresh_clear"
        case extra
        case logPb = "log_pb"
        case preloadAds = "preload_ads"
    }
}

// MARK: Feed convenience initializers and mutators

extension Feed {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Feed.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        statusCode: Int?? = nil,
        minCursor: Int?? = nil,
        maxCursor: Int?? = nil,
        hasMore: Int?? = nil,
        awemeList: [AwemeList]?? = nil,
        homeModel: Int?? = nil,
        refreshClear: Int?? = nil,
        extra: Extra?? = nil,
        logPb: LogPb?? = nil,
        preloadAds: [JSONAny]?? = nil
    ) -> Feed {
        return Feed(
            statusCode: statusCode ?? self.statusCode,
            minCursor: minCursor ?? self.minCursor,
            maxCursor: maxCursor ?? self.maxCursor,
            hasMore: hasMore ?? self.hasMore,
            awemeList: awemeList ?? self.awemeList,
            homeModel: homeModel ?? self.homeModel,
            refreshClear: refreshClear ?? self.refreshClear,
            extra: extra ?? self.extra,
            logPb: logPb ?? self.logPb,
            preloadAds: preloadAds ?? self.preloadAds
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - AwemeList
struct AwemeList: Codable {
    let awemeID, desc: String?
    let createTime: Int?
    let author: AwemeListAuthor?
    let music: Music?
    let chaList: [ChaList]?
    let video: Video?
    let shareURL: String?
    let userDigged: Int?
    let statistics: Statistics?
    let status: Status?
    let rate: Int?
    let textExtra: [TextExtra]?
    let isTop: Int?
    let labelTop: LabelTop?
    let shareInfo: ChaListShareInfo?
    let distance: String?
    let videoLabels: [JSONAny]?
    let isVR, isAds: Bool?
    let duration, awemeType: Int?
    let isFantasy, cmtSWT: Bool?
    let imageInfos: JSONNull?
    let riskInfos: RiskInfos?
    let isRelieve: Bool?
    let sortLabel: String?
    let position, uniqidPosition, commentList: JSONNull?
    let authorUserID, bodydanceScore: Int?
    let geofencing: [JSONAny]?
    let isHashTag: Int?
    let isPgcshow: Bool?
    let region: String?
    let videoText: [JSONAny]?
    let vrType, collectStat: Int?
    let labelTopText: JSONNull?
    let promotions: [JSONAny]?
    let groupID: String?
    let preventDownload: Bool?
    let nicknamePosition, challengePosition: JSONNull?
    let itemCommentSettings: Int?
    let withPromotionalMusic: Bool?
    let xiguaTask: XiguaTask?
    let longVideo: JSONNull?
    let itemDuet, itemReact: Int?
    let descLanguage: String?
    let interactionStickers: JSONNull?
    let miscInfo: String?
    let originCommentIDS, commerceConfigData: JSONNull?
    let enableTopView: Bool?
    let distributeType: Int?
    let videoControl: VideoControl?
    let awemeControl: AwemeControl?
    let descendants: Descendants?
    let poiInfo: PoiInfo?

    enum CodingKeys: String, CodingKey {
        case awemeID = "aweme_id"
        case desc
        case createTime = "create_time"
        case author, music
        case chaList = "cha_list"
        case video
        case shareURL = "share_url"
        case userDigged = "user_digged"
        case statistics, status, rate
        case textExtra = "text_extra"
        case isTop = "is_top"
        case labelTop = "label_top"
        case shareInfo = "share_info"
        case distance
        case videoLabels = "video_labels"
        case isVR = "is_vr"
        case isAds = "is_ads"
        case duration
        case awemeType = "aweme_type"
        case isFantasy = "is_fantasy"
        case cmtSWT = "cmt_swt"
        case imageInfos = "image_infos"
        case riskInfos = "risk_infos"
        case isRelieve = "is_relieve"
        case sortLabel = "sort_label"
        case position
        case uniqidPosition = "uniqid_position"
        case commentList = "comment_list"
        case authorUserID = "author_user_id"
        case bodydanceScore = "bodydance_score"
        case geofencing
        case isHashTag = "is_hash_tag"
        case isPgcshow = "is_pgcshow"
        case region
        case videoText = "video_text"
        case vrType = "vr_type"
        case collectStat = "collect_stat"
        case labelTopText = "label_top_text"
        case promotions
        case groupID = "group_id"
        case preventDownload = "prevent_download"
        case nicknamePosition = "nickname_position"
        case challengePosition = "challenge_position"
        case itemCommentSettings = "item_comment_settings"
        case withPromotionalMusic = "with_promotional_music"
        case xiguaTask = "xigua_task"
        case longVideo = "long_video"
        case itemDuet = "item_duet"
        case itemReact = "item_react"
        case descLanguage = "desc_language"
        case interactionStickers = "interaction_stickers"
        case miscInfo = "misc_info"
        case originCommentIDS = "origin_comment_ids"
        case commerceConfigData = "commerce_config_data"
        case enableTopView = "enable_top_view"
        case distributeType = "distribute_type"
        case videoControl = "video_control"
        case awemeControl = "aweme_control"
        case descendants
        case poiInfo = "poi_info"
    }
}

// MARK: AwemeList convenience initializers and mutators

extension AwemeList {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(AwemeList.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        awemeID: String?? = nil,
        desc: String?? = nil,
        createTime: Int?? = nil,
        author: AwemeListAuthor?? = nil,
        music: Music?? = nil,
        chaList: [ChaList]?? = nil,
        video: Video?? = nil,
        shareURL: String?? = nil,
        userDigged: Int?? = nil,
        statistics: Statistics?? = nil,
        status: Status?? = nil,
        rate: Int?? = nil,
        textExtra: [TextExtra]?? = nil,
        isTop: Int?? = nil,
        labelTop: LabelTop?? = nil,
        shareInfo: ChaListShareInfo?? = nil,
        distance: String?? = nil,
        videoLabels: [JSONAny]?? = nil,
        isVR: Bool?? = nil,
        isAds: Bool?? = nil,
        duration: Int?? = nil,
        awemeType: Int?? = nil,
        isFantasy: Bool?? = nil,
        cmtSWT: Bool?? = nil,
        imageInfos: JSONNull?? = nil,
        riskInfos: RiskInfos?? = nil,
        isRelieve: Bool?? = nil,
        sortLabel: String?? = nil,
        position: JSONNull?? = nil,
        uniqidPosition: JSONNull?? = nil,
        commentList: JSONNull?? = nil,
        authorUserID: Int?? = nil,
        bodydanceScore: Int?? = nil,
        geofencing: [JSONAny]?? = nil,
        isHashTag: Int?? = nil,
        isPgcshow: Bool?? = nil,
        region: String?? = nil,
        videoText: [JSONAny]?? = nil,
        vrType: Int?? = nil,
        collectStat: Int?? = nil,
        labelTopText: JSONNull?? = nil,
        promotions: [JSONAny]?? = nil,
        groupID: String?? = nil,
        preventDownload: Bool?? = nil,
        nicknamePosition: JSONNull?? = nil,
        challengePosition: JSONNull?? = nil,
        itemCommentSettings: Int?? = nil,
        withPromotionalMusic: Bool?? = nil,
        xiguaTask: XiguaTask?? = nil,
        longVideo: JSONNull?? = nil,
        itemDuet: Int?? = nil,
        itemReact: Int?? = nil,
        descLanguage: String?? = nil,
        interactionStickers: JSONNull?? = nil,
        miscInfo: String?? = nil,
        originCommentIDS: JSONNull?? = nil,
        commerceConfigData: JSONNull?? = nil,
        enableTopView: Bool?? = nil,
        distributeType: Int?? = nil,
        videoControl: VideoControl?? = nil,
        awemeControl: AwemeControl?? = nil,
        descendants: Descendants?? = nil,
        poiInfo: PoiInfo?? = nil
    ) -> AwemeList {
        return AwemeList(
            awemeID: awemeID ?? self.awemeID,
            desc: desc ?? self.desc,
            createTime: createTime ?? self.createTime,
            author: author ?? self.author,
            music: music ?? self.music,
            chaList: chaList ?? self.chaList,
            video: video ?? self.video,
            shareURL: shareURL ?? self.shareURL,
            userDigged: userDigged ?? self.userDigged,
            statistics: statistics ?? self.statistics,
            status: status ?? self.status,
            rate: rate ?? self.rate,
            textExtra: textExtra ?? self.textExtra,
            isTop: isTop ?? self.isTop,
            labelTop: labelTop ?? self.labelTop,
            shareInfo: shareInfo ?? self.shareInfo,
            distance: distance ?? self.distance,
            videoLabels: videoLabels ?? self.videoLabels,
            isVR: isVR ?? self.isVR,
            isAds: isAds ?? self.isAds,
            duration: duration ?? self.duration,
            awemeType: awemeType ?? self.awemeType,
            isFantasy: isFantasy ?? self.isFantasy,
            cmtSWT: cmtSWT ?? self.cmtSWT,
            imageInfos: imageInfos ?? self.imageInfos,
            riskInfos: riskInfos ?? self.riskInfos,
            isRelieve: isRelieve ?? self.isRelieve,
            sortLabel: sortLabel ?? self.sortLabel,
            position: position ?? self.position,
            uniqidPosition: uniqidPosition ?? self.uniqidPosition,
            commentList: commentList ?? self.commentList,
            authorUserID: authorUserID ?? self.authorUserID,
            bodydanceScore: bodydanceScore ?? self.bodydanceScore,
            geofencing: geofencing ?? self.geofencing,
            isHashTag: isHashTag ?? self.isHashTag,
            isPgcshow: isPgcshow ?? self.isPgcshow,
            region: region ?? self.region,
            videoText: videoText ?? self.videoText,
            vrType: vrType ?? self.vrType,
            collectStat: collectStat ?? self.collectStat,
            labelTopText: labelTopText ?? self.labelTopText,
            promotions: promotions ?? self.promotions,
            groupID: groupID ?? self.groupID,
            preventDownload: preventDownload ?? self.preventDownload,
            nicknamePosition: nicknamePosition ?? self.nicknamePosition,
            challengePosition: challengePosition ?? self.challengePosition,
            itemCommentSettings: itemCommentSettings ?? self.itemCommentSettings,
            withPromotionalMusic: withPromotionalMusic ?? self.withPromotionalMusic,
            xiguaTask: xiguaTask ?? self.xiguaTask,
            longVideo: longVideo ?? self.longVideo,
            itemDuet: itemDuet ?? self.itemDuet,
            itemReact: itemReact ?? self.itemReact,
            descLanguage: descLanguage ?? self.descLanguage,
            interactionStickers: interactionStickers ?? self.interactionStickers,
            miscInfo: miscInfo ?? self.miscInfo,
            originCommentIDS: originCommentIDS ?? self.originCommentIDS,
            commerceConfigData: commerceConfigData ?? self.commerceConfigData,
            enableTopView: enableTopView ?? self.enableTopView,
            distributeType: distributeType ?? self.distributeType,
            videoControl: videoControl ?? self.videoControl,
            awemeControl: awemeControl ?? self.awemeControl,
            descendants: descendants ?? self.descendants,
            poiInfo: poiInfo ?? self.poiInfo
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - AwemeListAuthor
struct AwemeListAuthor: Codable {
    let uid, shortID, nickname: String?
    let gender: Int?
    let signature: String?
    let avatarLarger, avatarThumb, avatarMedium: LabelTop?
    let birthday: String?
    let isVerified: Bool?
    let followStatus, awemeCount, followingCount, followerCount: Int?
    let favoritingCount, totalFavorited: Int?
    let isBlock, hideSearch: Bool?
    let constellation: Int?
    let location: String?
    let hideLocation: Bool?
    let weiboVerify, customVerify, uniqueID, bindPhone: String?
    let specialLock, needRecommend: Int?
    let isBindedWeibo: Bool?
    let weiboName, weiboSchema, weiboURL: String?
    let storyOpen: Bool?
    let storyCount: Int?
    let hasFacebookToken, hasTwitterToken: Bool?
    let fbExpireTime, twExpireTime: Int?
    let hasYoutubeToken: Bool?
    let youtubeExpireTime, roomID, liveVerify, authorityStatus: Int?
    let verifyInfo: String?
    let shieldFollowNotice, shieldDiggNotice, shieldCommentNotice: Int?
    let schoolName, schoolPoiID: String?
    let schoolType: Int?
    let shareInfo: AuthorShareInfo?
    let withCommerceEntry: Bool?
    let verificationType: Int?
    let enterpriseVerifyReason: String?
    let isAdFake: Bool?
    let followersDetail: JSONNull?
    let region, accountRegion: String?
    let syncToToutiao, commerceUserLevel, liveAgreement: Int?
    let platformSyncInfo: JSONNull?
    let withShopEntry, isDisciplineMember: Bool?
    let secret: Int?
    let hasOrders, preventDownload, showImageBubble: Bool?
    let geofencing: [JSONAny]?
    let uniqueIDModifyTime: Int?
    let videoIcon: LabelTop?
    let insID, googleAccount, youtubeChannelID, youtubeChannelTitle: String?
    let appleAccount: Int?
    let withDouEntry, withFusionShopEntry, isPhoneBinded, acceptPrivatePolicy: Bool?
    let twitterID, twitterName: String?
    let userCanceled, hasEmail, isGovMediaVip: Bool?
    let liveAgreementTime, status, createTime: Int?
    let avatarURI: String?
    let followerStatus, neiguangShield, commentSetting, duetSetting: Int?
    let reflowPageGid, reflowPageUid, userRate, downloadSetting: Int?
    let downloadPromptTs, reactSetting: Int?
    let liveCommerce: Bool?
    let coverURL: [LabelTop]?
    let language: String?
    let hasInsights: Bool?
    let shareQrcodeURI: String?
    let itemList: JSONNull?
    let userMode, userPeriod: Int?
    let hasUnreadStory: Bool?
    let newStoryCover: JSONNull?
    let isStar: Bool?
    let cvLevel: String?
    let typeLabel, adCoverURL: JSONNull?
    let commentFilterStatus: Int?
    let avatar168X168, avatar300X300: LabelTop?
    let relativeUsers, chaList: JSONNull?
    let secUid: String?

    enum CodingKeys: String, CodingKey {
        case uid
        case shortID = "short_id"
        case nickname, gender, signature
        case avatarLarger = "avatar_larger"
        case avatarThumb = "avatar_thumb"
        case avatarMedium = "avatar_medium"
        case birthday
        case isVerified = "is_verified"
        case followStatus = "follow_status"
        case awemeCount = "aweme_count"
        case followingCount = "following_count"
        case followerCount = "follower_count"
        case favoritingCount = "favoriting_count"
        case totalFavorited = "total_favorited"
        case isBlock = "is_block"
        case hideSearch = "hide_search"
        case constellation, location
        case hideLocation = "hide_location"
        case weiboVerify = "weibo_verify"
        case customVerify = "custom_verify"
        case uniqueID = "unique_id"
        case bindPhone = "bind_phone"
        case specialLock = "special_lock"
        case needRecommend = "need_recommend"
        case isBindedWeibo = "is_binded_weibo"
        case weiboName = "weibo_name"
        case weiboSchema = "weibo_schema"
        case weiboURL = "weibo_url"
        case storyOpen = "story_open"
        case storyCount = "story_count"
        case hasFacebookToken = "has_facebook_token"
        case hasTwitterToken = "has_twitter_token"
        case fbExpireTime = "fb_expire_time"
        case twExpireTime = "tw_expire_time"
        case hasYoutubeToken = "has_youtube_token"
        case youtubeExpireTime = "youtube_expire_time"
        case roomID = "room_id"
        case liveVerify = "live_verify"
        case authorityStatus = "authority_status"
        case verifyInfo = "verify_info"
        case shieldFollowNotice = "shield_follow_notice"
        case shieldDiggNotice = "shield_digg_notice"
        case shieldCommentNotice = "shield_comment_notice"
        case schoolName = "school_name"
        case schoolPoiID = "school_poi_id"
        case schoolType = "school_type"
        case shareInfo = "share_info"
        case withCommerceEntry = "with_commerce_entry"
        case verificationType = "verification_type"
        case enterpriseVerifyReason = "enterprise_verify_reason"
        case isAdFake = "is_ad_fake"
        case followersDetail = "followers_detail"
        case region
        case accountRegion = "account_region"
        case syncToToutiao = "sync_to_toutiao"
        case commerceUserLevel = "commerce_user_level"
        case liveAgreement = "live_agreement"
        case platformSyncInfo = "platform_sync_info"
        case withShopEntry = "with_shop_entry"
        case isDisciplineMember = "is_discipline_member"
        case secret
        case hasOrders = "has_orders"
        case preventDownload = "prevent_download"
        case showImageBubble = "show_image_bubble"
        case geofencing
        case uniqueIDModifyTime = "unique_id_modify_time"
        case videoIcon = "video_icon"
        case insID = "ins_id"
        case googleAccount = "google_account"
        case youtubeChannelID = "youtube_channel_id"
        case youtubeChannelTitle = "youtube_channel_title"
        case appleAccount = "apple_account"
        case withDouEntry = "with_dou_entry"
        case withFusionShopEntry = "with_fusion_shop_entry"
        case isPhoneBinded = "is_phone_binded"
        case acceptPrivatePolicy = "accept_private_policy"
        case twitterID = "twitter_id"
        case twitterName = "twitter_name"
        case userCanceled = "user_canceled"
        case hasEmail = "has_email"
        case isGovMediaVip = "is_gov_media_vip"
        case liveAgreementTime = "live_agreement_time"
        case status
        case createTime = "create_time"
        case avatarURI = "avatar_uri"
        case followerStatus = "follower_status"
        case neiguangShield = "neiguang_shield"
        case commentSetting = "comment_setting"
        case duetSetting = "duet_setting"
        case reflowPageGid = "reflow_page_gid"
        case reflowPageUid = "reflow_page_uid"
        case userRate = "user_rate"
        case downloadSetting = "download_setting"
        case downloadPromptTs = "download_prompt_ts"
        case reactSetting = "react_setting"
        case liveCommerce = "live_commerce"
        case coverURL = "cover_url"
        case language
        case hasInsights = "has_insights"
        case shareQrcodeURI = "share_qrcode_uri"
        case itemList = "item_list"
        case userMode = "user_mode"
        case userPeriod = "user_period"
        case hasUnreadStory = "has_unread_story"
        case newStoryCover = "new_story_cover"
        case isStar = "is_star"
        case cvLevel = "cv_level"
        case typeLabel = "type_label"
        case adCoverURL = "ad_cover_url"
        case commentFilterStatus = "comment_filter_status"
        case avatar168X168 = "avatar_168x168"
        case avatar300X300 = "avatar_300x300"
        case relativeUsers = "relative_users"
        case chaList = "cha_list"
        case secUid = "sec_uid"
    }
}

// MARK: AwemeListAuthor convenience initializers and mutators

extension AwemeListAuthor {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(AwemeListAuthor.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        uid: String?? = nil,
        shortID: String?? = nil,
        nickname: String?? = nil,
        gender: Int?? = nil,
        signature: String?? = nil,
        avatarLarger: LabelTop?? = nil,
        avatarThumb: LabelTop?? = nil,
        avatarMedium: LabelTop?? = nil,
        birthday: String?? = nil,
        isVerified: Bool?? = nil,
        followStatus: Int?? = nil,
        awemeCount: Int?? = nil,
        followingCount: Int?? = nil,
        followerCount: Int?? = nil,
        favoritingCount: Int?? = nil,
        totalFavorited: Int?? = nil,
        isBlock: Bool?? = nil,
        hideSearch: Bool?? = nil,
        constellation: Int?? = nil,
        location: String?? = nil,
        hideLocation: Bool?? = nil,
        weiboVerify: String?? = nil,
        customVerify: String?? = nil,
        uniqueID: String?? = nil,
        bindPhone: String?? = nil,
        specialLock: Int?? = nil,
        needRecommend: Int?? = nil,
        isBindedWeibo: Bool?? = nil,
        weiboName: String?? = nil,
        weiboSchema: String?? = nil,
        weiboURL: String?? = nil,
        storyOpen: Bool?? = nil,
        storyCount: Int?? = nil,
        hasFacebookToken: Bool?? = nil,
        hasTwitterToken: Bool?? = nil,
        fbExpireTime: Int?? = nil,
        twExpireTime: Int?? = nil,
        hasYoutubeToken: Bool?? = nil,
        youtubeExpireTime: Int?? = nil,
        roomID: Int?? = nil,
        liveVerify: Int?? = nil,
        authorityStatus: Int?? = nil,
        verifyInfo: String?? = nil,
        shieldFollowNotice: Int?? = nil,
        shieldDiggNotice: Int?? = nil,
        shieldCommentNotice: Int?? = nil,
        schoolName: String?? = nil,
        schoolPoiID: String?? = nil,
        schoolType: Int?? = nil,
        shareInfo: AuthorShareInfo?? = nil,
        withCommerceEntry: Bool?? = nil,
        verificationType: Int?? = nil,
        enterpriseVerifyReason: String?? = nil,
        isAdFake: Bool?? = nil,
        followersDetail: JSONNull?? = nil,
        region: String?? = nil,
        accountRegion: String?? = nil,
        syncToToutiao: Int?? = nil,
        commerceUserLevel: Int?? = nil,
        liveAgreement: Int?? = nil,
        platformSyncInfo: JSONNull?? = nil,
        withShopEntry: Bool?? = nil,
        isDisciplineMember: Bool?? = nil,
        secret: Int?? = nil,
        hasOrders: Bool?? = nil,
        preventDownload: Bool?? = nil,
        showImageBubble: Bool?? = nil,
        geofencing: [JSONAny]?? = nil,
        uniqueIDModifyTime: Int?? = nil,
        videoIcon: LabelTop?? = nil,
        insID: String?? = nil,
        googleAccount: String?? = nil,
        youtubeChannelID: String?? = nil,
        youtubeChannelTitle: String?? = nil,
        appleAccount: Int?? = nil,
        withDouEntry: Bool?? = nil,
        withFusionShopEntry: Bool?? = nil,
        isPhoneBinded: Bool?? = nil,
        acceptPrivatePolicy: Bool?? = nil,
        twitterID: String?? = nil,
        twitterName: String?? = nil,
        userCanceled: Bool?? = nil,
        hasEmail: Bool?? = nil,
        isGovMediaVip: Bool?? = nil,
        liveAgreementTime: Int?? = nil,
        status: Int?? = nil,
        createTime: Int?? = nil,
        avatarURI: String?? = nil,
        followerStatus: Int?? = nil,
        neiguangShield: Int?? = nil,
        commentSetting: Int?? = nil,
        duetSetting: Int?? = nil,
        reflowPageGid: Int?? = nil,
        reflowPageUid: Int?? = nil,
        userRate: Int?? = nil,
        downloadSetting: Int?? = nil,
        downloadPromptTs: Int?? = nil,
        reactSetting: Int?? = nil,
        liveCommerce: Bool?? = nil,
        coverURL: [LabelTop]?? = nil,
        language: String?? = nil,
        hasInsights: Bool?? = nil,
        shareQrcodeURI: String?? = nil,
        itemList: JSONNull?? = nil,
        userMode: Int?? = nil,
        userPeriod: Int?? = nil,
        hasUnreadStory: Bool?? = nil,
        newStoryCover: JSONNull?? = nil,
        isStar: Bool?? = nil,
        cvLevel: String?? = nil,
        typeLabel: JSONNull?? = nil,
        adCoverURL: JSONNull?? = nil,
        commentFilterStatus: Int?? = nil,
        avatar168X168: LabelTop?? = nil,
        avatar300X300: LabelTop?? = nil,
        relativeUsers: JSONNull?? = nil,
        chaList: JSONNull?? = nil,
        secUid: String?? = nil
    ) -> AwemeListAuthor {
        return AwemeListAuthor(
            uid: uid ?? self.uid,
            shortID: shortID ?? self.shortID,
            nickname: nickname ?? self.nickname,
            gender: gender ?? self.gender,
            signature: signature ?? self.signature,
            avatarLarger: avatarLarger ?? self.avatarLarger,
            avatarThumb: avatarThumb ?? self.avatarThumb,
            avatarMedium: avatarMedium ?? self.avatarMedium,
            birthday: birthday ?? self.birthday,
            isVerified: isVerified ?? self.isVerified,
            followStatus: followStatus ?? self.followStatus,
            awemeCount: awemeCount ?? self.awemeCount,
            followingCount: followingCount ?? self.followingCount,
            followerCount: followerCount ?? self.followerCount,
            favoritingCount: favoritingCount ?? self.favoritingCount,
            totalFavorited: totalFavorited ?? self.totalFavorited,
            isBlock: isBlock ?? self.isBlock,
            hideSearch: hideSearch ?? self.hideSearch,
            constellation: constellation ?? self.constellation,
            location: location ?? self.location,
            hideLocation: hideLocation ?? self.hideLocation,
            weiboVerify: weiboVerify ?? self.weiboVerify,
            customVerify: customVerify ?? self.customVerify,
            uniqueID: uniqueID ?? self.uniqueID,
            bindPhone: bindPhone ?? self.bindPhone,
            specialLock: specialLock ?? self.specialLock,
            needRecommend: needRecommend ?? self.needRecommend,
            isBindedWeibo: isBindedWeibo ?? self.isBindedWeibo,
            weiboName: weiboName ?? self.weiboName,
            weiboSchema: weiboSchema ?? self.weiboSchema,
            weiboURL: weiboURL ?? self.weiboURL,
            storyOpen: storyOpen ?? self.storyOpen,
            storyCount: storyCount ?? self.storyCount,
            hasFacebookToken: hasFacebookToken ?? self.hasFacebookToken,
            hasTwitterToken: hasTwitterToken ?? self.hasTwitterToken,
            fbExpireTime: fbExpireTime ?? self.fbExpireTime,
            twExpireTime: twExpireTime ?? self.twExpireTime,
            hasYoutubeToken: hasYoutubeToken ?? self.hasYoutubeToken,
            youtubeExpireTime: youtubeExpireTime ?? self.youtubeExpireTime,
            roomID: roomID ?? self.roomID,
            liveVerify: liveVerify ?? self.liveVerify,
            authorityStatus: authorityStatus ?? self.authorityStatus,
            verifyInfo: verifyInfo ?? self.verifyInfo,
            shieldFollowNotice: shieldFollowNotice ?? self.shieldFollowNotice,
            shieldDiggNotice: shieldDiggNotice ?? self.shieldDiggNotice,
            shieldCommentNotice: shieldCommentNotice ?? self.shieldCommentNotice,
            schoolName: schoolName ?? self.schoolName,
            schoolPoiID: schoolPoiID ?? self.schoolPoiID,
            schoolType: schoolType ?? self.schoolType,
            shareInfo: shareInfo ?? self.shareInfo,
            withCommerceEntry: withCommerceEntry ?? self.withCommerceEntry,
            verificationType: verificationType ?? self.verificationType,
            enterpriseVerifyReason: enterpriseVerifyReason ?? self.enterpriseVerifyReason,
            isAdFake: isAdFake ?? self.isAdFake,
            followersDetail: followersDetail ?? self.followersDetail,
            region: region ?? self.region,
            accountRegion: accountRegion ?? self.accountRegion,
            syncToToutiao: syncToToutiao ?? self.syncToToutiao,
            commerceUserLevel: commerceUserLevel ?? self.commerceUserLevel,
            liveAgreement: liveAgreement ?? self.liveAgreement,
            platformSyncInfo: platformSyncInfo ?? self.platformSyncInfo,
            withShopEntry: withShopEntry ?? self.withShopEntry,
            isDisciplineMember: isDisciplineMember ?? self.isDisciplineMember,
            secret: secret ?? self.secret,
            hasOrders: hasOrders ?? self.hasOrders,
            preventDownload: preventDownload ?? self.preventDownload,
            showImageBubble: showImageBubble ?? self.showImageBubble,
            geofencing: geofencing ?? self.geofencing,
            uniqueIDModifyTime: uniqueIDModifyTime ?? self.uniqueIDModifyTime,
            videoIcon: videoIcon ?? self.videoIcon,
            insID: insID ?? self.insID,
            googleAccount: googleAccount ?? self.googleAccount,
            youtubeChannelID: youtubeChannelID ?? self.youtubeChannelID,
            youtubeChannelTitle: youtubeChannelTitle ?? self.youtubeChannelTitle,
            appleAccount: appleAccount ?? self.appleAccount,
            withDouEntry: withDouEntry ?? self.withDouEntry,
            withFusionShopEntry: withFusionShopEntry ?? self.withFusionShopEntry,
            isPhoneBinded: isPhoneBinded ?? self.isPhoneBinded,
            acceptPrivatePolicy: acceptPrivatePolicy ?? self.acceptPrivatePolicy,
            twitterID: twitterID ?? self.twitterID,
            twitterName: twitterName ?? self.twitterName,
            userCanceled: userCanceled ?? self.userCanceled,
            hasEmail: hasEmail ?? self.hasEmail,
            isGovMediaVip: isGovMediaVip ?? self.isGovMediaVip,
            liveAgreementTime: liveAgreementTime ?? self.liveAgreementTime,
            status: status ?? self.status,
            createTime: createTime ?? self.createTime,
            avatarURI: avatarURI ?? self.avatarURI,
            followerStatus: followerStatus ?? self.followerStatus,
            neiguangShield: neiguangShield ?? self.neiguangShield,
            commentSetting: commentSetting ?? self.commentSetting,
            duetSetting: duetSetting ?? self.duetSetting,
            reflowPageGid: reflowPageGid ?? self.reflowPageGid,
            reflowPageUid: reflowPageUid ?? self.reflowPageUid,
            userRate: userRate ?? self.userRate,
            downloadSetting: downloadSetting ?? self.downloadSetting,
            downloadPromptTs: downloadPromptTs ?? self.downloadPromptTs,
            reactSetting: reactSetting ?? self.reactSetting,
            liveCommerce: liveCommerce ?? self.liveCommerce,
            coverURL: coverURL ?? self.coverURL,
            language: language ?? self.language,
            hasInsights: hasInsights ?? self.hasInsights,
            shareQrcodeURI: shareQrcodeURI ?? self.shareQrcodeURI,
            itemList: itemList ?? self.itemList,
            userMode: userMode ?? self.userMode,
            userPeriod: userPeriod ?? self.userPeriod,
            hasUnreadStory: hasUnreadStory ?? self.hasUnreadStory,
            newStoryCover: newStoryCover ?? self.newStoryCover,
            isStar: isStar ?? self.isStar,
            cvLevel: cvLevel ?? self.cvLevel,
            typeLabel: typeLabel ?? self.typeLabel,
            adCoverURL: adCoverURL ?? self.adCoverURL,
            commentFilterStatus: commentFilterStatus ?? self.commentFilterStatus,
            avatar168X168: avatar168X168 ?? self.avatar168X168,
            avatar300X300: avatar300X300 ?? self.avatar300X300,
            relativeUsers: relativeUsers ?? self.relativeUsers,
            chaList: chaList ?? self.chaList,
            secUid: secUid ?? self.secUid
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - LabelTop
struct LabelTop: Codable {
    let uri: String?
    let urlList: [String]?
    let width, height: Int?
    let urlKey: String?

    enum CodingKeys: String, CodingKey {
        case uri
        case urlList = "url_list"
        case width, height
        case urlKey = "url_key"
    }
}

// MARK: LabelTop convenience initializers and mutators

extension LabelTop {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(LabelTop.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        uri: String?? = nil,
        urlList: [String]?? = nil,
        width: Int?? = nil,
        height: Int?? = nil,
        urlKey: String?? = nil
    ) -> LabelTop {
        return LabelTop(
            uri: uri ?? self.uri,
            urlList: urlList ?? self.urlList,
            width: width ?? self.width,
            height: height ?? self.height,
            urlKey: urlKey ?? self.urlKey
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - AuthorShareInfo
struct AuthorShareInfo: Codable {
    let shareURL: String?
    let shareWeiboDesc, shareDesc, shareTitle: String?
    let shareQrcodeURL: LabelTop?
    let shareTitleMyself, shareTitleOther: String?
    let boolPersist: Int?

    enum CodingKeys: String, CodingKey {
        case shareURL = "share_url"
        case shareWeiboDesc = "share_weibo_desc"
        case shareDesc = "share_desc"
        case shareTitle = "share_title"
        case shareQrcodeURL = "share_qrcode_url"
        case shareTitleMyself = "share_title_myself"
        case shareTitleOther = "share_title_other"
        case boolPersist = "bool_persist"
    }
}

// MARK: AuthorShareInfo convenience initializers and mutators

extension AuthorShareInfo {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(AuthorShareInfo.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        shareURL: String?? = nil,
        shareWeiboDesc: String?? = nil,
        shareDesc: String?? = nil,
        shareTitle: String?? = nil,
        shareQrcodeURL: LabelTop?? = nil,
        shareTitleMyself: String?? = nil,
        shareTitleOther: String?? = nil,
        boolPersist: Int?? = nil
    ) -> AuthorShareInfo {
        return AuthorShareInfo(
            shareURL: shareURL ?? self.shareURL,
            shareWeiboDesc: shareWeiboDesc ?? self.shareWeiboDesc,
            shareDesc: shareDesc ?? self.shareDesc,
            shareTitle: shareTitle ?? self.shareTitle,
            shareQrcodeURL: shareQrcodeURL ?? self.shareQrcodeURL,
            shareTitleMyself: shareTitleMyself ?? self.shareTitleMyself,
            shareTitleOther: shareTitleOther ?? self.shareTitleOther,
            boolPersist: boolPersist ?? self.boolPersist
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - AwemeControl
struct AwemeControl: Codable {
    let canForward, canShare, canComment, canShowComment: Bool?

    enum CodingKeys: String, CodingKey {
        case canForward = "can_forward"
        case canShare = "can_share"
        case canComment = "can_comment"
        case canShowComment = "can_show_comment"
    }
}

// MARK: AwemeControl convenience initializers and mutators

extension AwemeControl {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(AwemeControl.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        canForward: Bool?? = nil,
        canShare: Bool?? = nil,
        canComment: Bool?? = nil,
        canShowComment: Bool?? = nil
    ) -> AwemeControl {
        return AwemeControl(
            canForward: canForward ?? self.canForward,
            canShare: canShare ?? self.canShare,
            canComment: canComment ?? self.canComment,
            canShowComment: canShowComment ?? self.canShowComment
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - ChaList
struct ChaList: Codable {
    let cid, chaName, desc, schema: String?
    let author: ChaListAuthor?
    let userCount: Int?
    let shareInfo: ChaListShareInfo?
    let connectMusic: [JSONAny]?
    let type, subType: Int?
    let isPgcshow: Bool?
    let collectStat, isChallenge, viewCount: Int?
    let isCommerce: Bool?
    let chaAttrs: JSONNull?

    enum CodingKeys: String, CodingKey {
        case cid
        case chaName = "cha_name"
        case desc, schema, author
        case userCount = "user_count"
        case shareInfo = "share_info"
        case connectMusic = "connect_music"
        case type
        case subType = "sub_type"
        case isPgcshow = "is_pgcshow"
        case collectStat = "collect_stat"
        case isChallenge = "is_challenge"
        case viewCount = "view_count"
        case isCommerce = "is_commerce"
        case chaAttrs = "cha_attrs"
    }
}

// MARK: ChaList convenience initializers and mutators

extension ChaList {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(ChaList.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        cid: String?? = nil,
        chaName: String?? = nil,
        desc: String?? = nil,
        schema: String?? = nil,
        author: ChaListAuthor?? = nil,
        userCount: Int?? = nil,
        shareInfo: ChaListShareInfo?? = nil,
        connectMusic: [JSONAny]?? = nil,
        type: Int?? = nil,
        subType: Int?? = nil,
        isPgcshow: Bool?? = nil,
        collectStat: Int?? = nil,
        isChallenge: Int?? = nil,
        viewCount: Int?? = nil,
        isCommerce: Bool?? = nil,
        chaAttrs: JSONNull?? = nil
    ) -> ChaList {
        return ChaList(
            cid: cid ?? self.cid,
            chaName: chaName ?? self.chaName,
            desc: desc ?? self.desc,
            schema: schema ?? self.schema,
            author: author ?? self.author,
            userCount: userCount ?? self.userCount,
            shareInfo: shareInfo ?? self.shareInfo,
            connectMusic: connectMusic ?? self.connectMusic,
            type: type ?? self.type,
            subType: subType ?? self.subType,
            isPgcshow: isPgcshow ?? self.isPgcshow,
            collectStat: collectStat ?? self.collectStat,
            isChallenge: isChallenge ?? self.isChallenge,
            viewCount: viewCount ?? self.viewCount,
            isCommerce: isCommerce ?? self.isCommerce,
            chaAttrs: chaAttrs ?? self.chaAttrs
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - ChaListAuthor
struct ChaListAuthor: Codable {
    let followersDetail, platformSyncInfo, geofencing, coverURL: JSONNull?
    let itemList, newStoryCover, typeLabel, adCoverURL: JSONNull?
    let relativeUsers, chaList: JSONNull?

    enum CodingKeys: String, CodingKey {
        case followersDetail = "followers_detail"
        case platformSyncInfo = "platform_sync_info"
        case geofencing
        case coverURL = "cover_url"
        case itemList = "item_list"
        case newStoryCover = "new_story_cover"
        case typeLabel = "type_label"
        case adCoverURL = "ad_cover_url"
        case relativeUsers = "relative_users"
        case chaList = "cha_list"
    }
}

// MARK: ChaListAuthor convenience initializers and mutators

extension ChaListAuthor {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(ChaListAuthor.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        followersDetail: JSONNull?? = nil,
        platformSyncInfo: JSONNull?? = nil,
        geofencing: JSONNull?? = nil,
        coverURL: JSONNull?? = nil,
        itemList: JSONNull?? = nil,
        newStoryCover: JSONNull?? = nil,
        typeLabel: JSONNull?? = nil,
        adCoverURL: JSONNull?? = nil,
        relativeUsers: JSONNull?? = nil,
        chaList: JSONNull?? = nil
    ) -> ChaListAuthor {
        return ChaListAuthor(
            followersDetail: followersDetail ?? self.followersDetail,
            platformSyncInfo: platformSyncInfo ?? self.platformSyncInfo,
            geofencing: geofencing ?? self.geofencing,
            coverURL: coverURL ?? self.coverURL,
            itemList: itemList ?? self.itemList,
            newStoryCover: newStoryCover ?? self.newStoryCover,
            typeLabel: typeLabel ?? self.typeLabel,
            adCoverURL: adCoverURL ?? self.adCoverURL,
            relativeUsers: relativeUsers ?? self.relativeUsers,
            chaList: chaList ?? self.chaList
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - ChaListShareInfo
struct ChaListShareInfo: Codable {
    let shareURL: String?
    let shareWeiboDesc, shareDesc, shareTitle: String?
    let boolPersist: Int?
    let shareTitleMyself, shareTitleOther: String?
    let shareSignatureURL: String?
    let shareSignatureDesc, shareQuote, shareLinkDesc: String?

    enum CodingKeys: String, CodingKey {
        case shareURL = "share_url"
        case shareWeiboDesc = "share_weibo_desc"
        case shareDesc = "share_desc"
        case shareTitle = "share_title"
        case boolPersist = "bool_persist"
        case shareTitleMyself = "share_title_myself"
        case shareTitleOther = "share_title_other"
        case shareSignatureURL = "share_signature_url"
        case shareSignatureDesc = "share_signature_desc"
        case shareQuote = "share_quote"
        case shareLinkDesc = "share_link_desc"
    }
}

// MARK: ChaListShareInfo convenience initializers and mutators

extension ChaListShareInfo {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(ChaListShareInfo.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        shareURL: String?? = nil,
        shareWeiboDesc: String?? = nil,
        shareDesc: String?? = nil,
        shareTitle: String?? = nil,
        boolPersist: Int?? = nil,
        shareTitleMyself: String?? = nil,
        shareTitleOther: String?? = nil,
        shareSignatureURL: String?? = nil,
        shareSignatureDesc: String?? = nil,
        shareQuote: String?? = nil,
        shareLinkDesc: String?? = nil
    ) -> ChaListShareInfo {
        return ChaListShareInfo(
            shareURL: shareURL ?? self.shareURL,
            shareWeiboDesc: shareWeiboDesc ?? self.shareWeiboDesc,
            shareDesc: shareDesc ?? self.shareDesc,
            shareTitle: shareTitle ?? self.shareTitle,
            boolPersist: boolPersist ?? self.boolPersist,
            shareTitleMyself: shareTitleMyself ?? self.shareTitleMyself,
            shareTitleOther: shareTitleOther ?? self.shareTitleOther,
            shareSignatureURL: shareSignatureURL ?? self.shareSignatureURL,
            shareSignatureDesc: shareSignatureDesc ?? self.shareSignatureDesc,
            shareQuote: shareQuote ?? self.shareQuote,
            shareLinkDesc: shareLinkDesc ?? self.shareLinkDesc
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Descendants
struct Descendants: Codable {
    let platforms: [String]?
    let notifyMsg: String?

    enum CodingKeys: String, CodingKey {
        case platforms
        case notifyMsg = "notify_msg"
    }
}

// MARK: Descendants convenience initializers and mutators

extension Descendants {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Descendants.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        platforms: [String]?? = nil,
        notifyMsg: String?? = nil
    ) -> Descendants {
        return Descendants(
            platforms: platforms ?? self.platforms,
            notifyMsg: notifyMsg ?? self.notifyMsg
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Music
struct Music: Codable {
    let id: Double?
    let idStr, title, author, album: String?
    let coverHD, coverLarge, coverMedium, coverThumb: LabelTop?
    let playURL: LabelTop?
    let schemaURL: String?
    let sourcePlatform, startTime, endTime, duration: Int?
    let extra: String?
    let userCount: Int?
    let position: JSONNull?
    let collectStat, status: Int?
    let offlineDesc, ownerID, ownerNickname: String?
    let isOriginal: Bool?
    let mid: String?
    let bindedChallengeID: Int?
    let redirect, isRestricted, authorDeleted, isDelVideo: Bool?
    let isVideoSelfSee: Bool?
    let ownerHandle: String?
    let authorPosition: JSONNull?
    let preventDownload: Bool?
    let strongBeatURL: LabelTop?
    let unshelveCountries: JSONNull?
    let preventItemDownloadStatus: Int?
    let externalSongInfo: [JSONAny]?
    let secUid: String?
    let avatarThumb, avatarMedium, avatarLarge: LabelTop?
    let previewStartTime, previewEndTime: Int?
    let effectsData, audioTrack: LabelTop?

    enum CodingKeys: String, CodingKey {
        case id
        case idStr = "id_str"
        case title, author, album
        case coverHD = "cover_hd"
        case coverLarge = "cover_large"
        case coverMedium = "cover_medium"
        case coverThumb = "cover_thumb"
        case playURL = "play_url"
        case schemaURL = "schema_url"
        case sourcePlatform = "source_platform"
        case startTime = "start_time"
        case endTime = "end_time"
        case duration, extra
        case userCount = "user_count"
        case position
        case collectStat = "collect_stat"
        case status
        case offlineDesc = "offline_desc"
        case ownerID = "owner_id"
        case ownerNickname = "owner_nickname"
        case isOriginal = "is_original"
        case mid
        case bindedChallengeID = "binded_challenge_id"
        case redirect
        case isRestricted = "is_restricted"
        case authorDeleted = "author_deleted"
        case isDelVideo = "is_del_video"
        case isVideoSelfSee = "is_video_self_see"
        case ownerHandle = "owner_handle"
        case authorPosition = "author_position"
        case preventDownload = "prevent_download"
        case strongBeatURL = "strong_beat_url"
        case unshelveCountries = "unshelve_countries"
        case preventItemDownloadStatus = "prevent_item_download_status"
        case externalSongInfo = "external_song_info"
        case secUid = "sec_uid"
        case avatarThumb = "avatar_thumb"
        case avatarMedium = "avatar_medium"
        case avatarLarge = "avatar_large"
        case previewStartTime = "preview_start_time"
        case previewEndTime = "preview_end_time"
        case effectsData = "effects_data"
        case audioTrack = "audio_track"
    }
}

// MARK: Music convenience initializers and mutators

extension Music {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Music.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        id: Double?? = nil,
        idStr: String?? = nil,
        title: String?? = nil,
        author: String?? = nil,
        album: String?? = nil,
        coverHD: LabelTop?? = nil,
        coverLarge: LabelTop?? = nil,
        coverMedium: LabelTop?? = nil,
        coverThumb: LabelTop?? = nil,
        playURL: LabelTop?? = nil,
        schemaURL: String?? = nil,
        sourcePlatform: Int?? = nil,
        startTime: Int?? = nil,
        endTime: Int?? = nil,
        duration: Int?? = nil,
        extra: String?? = nil,
        userCount: Int?? = nil,
        position: JSONNull?? = nil,
        collectStat: Int?? = nil,
        status: Int?? = nil,
        offlineDesc: String?? = nil,
        ownerID: String?? = nil,
        ownerNickname: String?? = nil,
        isOriginal: Bool?? = nil,
        mid: String?? = nil,
        bindedChallengeID: Int?? = nil,
        redirect: Bool?? = nil,
        isRestricted: Bool?? = nil,
        authorDeleted: Bool?? = nil,
        isDelVideo: Bool?? = nil,
        isVideoSelfSee: Bool?? = nil,
        ownerHandle: String?? = nil,
        authorPosition: JSONNull?? = nil,
        preventDownload: Bool?? = nil,
        strongBeatURL: LabelTop?? = nil,
        unshelveCountries: JSONNull?? = nil,
        preventItemDownloadStatus: Int?? = nil,
        externalSongInfo: [JSONAny]?? = nil,
        secUid: String?? = nil,
        avatarThumb: LabelTop?? = nil,
        avatarMedium: LabelTop?? = nil,
        avatarLarge: LabelTop?? = nil,
        previewStartTime: Int?? = nil,
        previewEndTime: Int?? = nil,
        effectsData: LabelTop?? = nil,
        audioTrack: LabelTop?? = nil
    ) -> Music {
        return Music(
            id: id ?? self.id,
            idStr: idStr ?? self.idStr,
            title: title ?? self.title,
            author: author ?? self.author,
            album: album ?? self.album,
            coverHD: coverHD ?? self.coverHD,
            coverLarge: coverLarge ?? self.coverLarge,
            coverMedium: coverMedium ?? self.coverMedium,
            coverThumb: coverThumb ?? self.coverThumb,
            playURL: playURL ?? self.playURL,
            schemaURL: schemaURL ?? self.schemaURL,
            sourcePlatform: sourcePlatform ?? self.sourcePlatform,
            startTime: startTime ?? self.startTime,
            endTime: endTime ?? self.endTime,
            duration: duration ?? self.duration,
            extra: extra ?? self.extra,
            userCount: userCount ?? self.userCount,
            position: position ?? self.position,
            collectStat: collectStat ?? self.collectStat,
            status: status ?? self.status,
            offlineDesc: offlineDesc ?? self.offlineDesc,
            ownerID: ownerID ?? self.ownerID,
            ownerNickname: ownerNickname ?? self.ownerNickname,
            isOriginal: isOriginal ?? self.isOriginal,
            mid: mid ?? self.mid,
            bindedChallengeID: bindedChallengeID ?? self.bindedChallengeID,
            redirect: redirect ?? self.redirect,
            isRestricted: isRestricted ?? self.isRestricted,
            authorDeleted: authorDeleted ?? self.authorDeleted,
            isDelVideo: isDelVideo ?? self.isDelVideo,
            isVideoSelfSee: isVideoSelfSee ?? self.isVideoSelfSee,
            ownerHandle: ownerHandle ?? self.ownerHandle,
            authorPosition: authorPosition ?? self.authorPosition,
            preventDownload: preventDownload ?? self.preventDownload,
            strongBeatURL: strongBeatURL ?? self.strongBeatURL,
            unshelveCountries: unshelveCountries ?? self.unshelveCountries,
            preventItemDownloadStatus: preventItemDownloadStatus ?? self.preventItemDownloadStatus,
            externalSongInfo: externalSongInfo ?? self.externalSongInfo,
            secUid: secUid ?? self.secUid,
            avatarThumb: avatarThumb ?? self.avatarThumb,
            avatarMedium: avatarMedium ?? self.avatarMedium,
            avatarLarge: avatarLarge ?? self.avatarLarge,
            previewStartTime: previewStartTime ?? self.previewStartTime,
            previewEndTime: previewEndTime ?? self.previewEndTime,
            effectsData: effectsData ?? self.effectsData,
            audioTrack: audioTrack ?? self.audioTrack
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - PoiInfo
struct PoiInfo: Codable {
    let poiID, poiName, typeCode: String?
    let userCount, itemCount: Int?
    let shareInfo: AuthorShareInfo?
    let coverHD, coverLarge, coverMedium, coverThumb: LabelTop?
    let distance: String?
    let addressInfo: AddressInfo?
    let iconType, collectStat: Int?
    let poiLongitude, poiLatitude: Double?
    let expandType: Int?
    let iconOnMap, iconOnEntry, iconOnInfo: LabelTop?
    let showType, poiSubtitleType: Int?
    let voucherReleaseAreas, poiFrontendType: JSONNull?
    let poiBackendType: PoiBackendType?
    let isAdminArea: Bool?
    let viewCount: String?

    enum CodingKeys: String, CodingKey {
        case poiID = "poi_id"
        case poiName = "poi_name"
        case typeCode = "type_code"
        case userCount = "user_count"
        case itemCount = "item_count"
        case shareInfo = "share_info"
        case coverHD = "cover_hd"
        case coverLarge = "cover_large"
        case coverMedium = "cover_medium"
        case coverThumb = "cover_thumb"
        case distance
        case addressInfo = "address_info"
        case iconType = "icon_type"
        case collectStat = "collect_stat"
        case poiLongitude = "poi_longitude"
        case poiLatitude = "poi_latitude"
        case expandType = "expand_type"
        case iconOnMap = "icon_on_map"
        case iconOnEntry = "icon_on_entry"
        case iconOnInfo = "icon_on_info"
        case showType = "show_type"
        case poiSubtitleType = "poi_subtitle_type"
        case voucherReleaseAreas = "voucher_release_areas"
        case poiFrontendType = "poi_frontend_type"
        case poiBackendType = "poi_backend_type"
        case isAdminArea = "is_admin_area"
        case viewCount = "view_count"
    }
}

// MARK: PoiInfo convenience initializers and mutators

extension PoiInfo {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(PoiInfo.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        poiID: String?? = nil,
        poiName: String?? = nil,
        typeCode: String?? = nil,
        userCount: Int?? = nil,
        itemCount: Int?? = nil,
        shareInfo: AuthorShareInfo?? = nil,
        coverHD: LabelTop?? = nil,
        coverLarge: LabelTop?? = nil,
        coverMedium: LabelTop?? = nil,
        coverThumb: LabelTop?? = nil,
        distance: String?? = nil,
        addressInfo: AddressInfo?? = nil,
        iconType: Int?? = nil,
        collectStat: Int?? = nil,
        poiLongitude: Double?? = nil,
        poiLatitude: Double?? = nil,
        expandType: Int?? = nil,
        iconOnMap: LabelTop?? = nil,
        iconOnEntry: LabelTop?? = nil,
        iconOnInfo: LabelTop?? = nil,
        showType: Int?? = nil,
        poiSubtitleType: Int?? = nil,
        voucherReleaseAreas: JSONNull?? = nil,
        poiFrontendType: JSONNull?? = nil,
        poiBackendType: PoiBackendType?? = nil,
        isAdminArea: Bool?? = nil,
        viewCount: String?? = nil
    ) -> PoiInfo {
        return PoiInfo(
            poiID: poiID ?? self.poiID,
            poiName: poiName ?? self.poiName,
            typeCode: typeCode ?? self.typeCode,
            userCount: userCount ?? self.userCount,
            itemCount: itemCount ?? self.itemCount,
            shareInfo: shareInfo ?? self.shareInfo,
            coverHD: coverHD ?? self.coverHD,
            coverLarge: coverLarge ?? self.coverLarge,
            coverMedium: coverMedium ?? self.coverMedium,
            coverThumb: coverThumb ?? self.coverThumb,
            distance: distance ?? self.distance,
            addressInfo: addressInfo ?? self.addressInfo,
            iconType: iconType ?? self.iconType,
            collectStat: collectStat ?? self.collectStat,
            poiLongitude: poiLongitude ?? self.poiLongitude,
            poiLatitude: poiLatitude ?? self.poiLatitude,
            expandType: expandType ?? self.expandType,
            iconOnMap: iconOnMap ?? self.iconOnMap,
            iconOnEntry: iconOnEntry ?? self.iconOnEntry,
            iconOnInfo: iconOnInfo ?? self.iconOnInfo,
            showType: showType ?? self.showType,
            poiSubtitleType: poiSubtitleType ?? self.poiSubtitleType,
            voucherReleaseAreas: voucherReleaseAreas ?? self.voucherReleaseAreas,
            poiFrontendType: poiFrontendType ?? self.poiFrontendType,
            poiBackendType: poiBackendType ?? self.poiBackendType,
            isAdminArea: isAdminArea ?? self.isAdminArea,
            viewCount: viewCount ?? self.viewCount
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - AddressInfo
struct AddressInfo: Codable {
    let province, city, district, address: String?
    let simpleAddr, cityCode, country, countryCode: String?

    enum CodingKeys: String, CodingKey {
        case province, city, district, address
        case simpleAddr = "simple_addr"
        case cityCode = "city_code"
        case country
        case countryCode = "country_code"
    }
}

// MARK: AddressInfo convenience initializers and mutators

extension AddressInfo {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(AddressInfo.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        province: String?? = nil,
        city: String?? = nil,
        district: String?? = nil,
        address: String?? = nil,
        simpleAddr: String?? = nil,
        cityCode: String?? = nil,
        country: String?? = nil,
        countryCode: String?? = nil
    ) -> AddressInfo {
        return AddressInfo(
            province: province ?? self.province,
            city: city ?? self.city,
            district: district ?? self.district,
            address: address ?? self.address,
            simpleAddr: simpleAddr ?? self.simpleAddr,
            cityCode: cityCode ?? self.cityCode,
            country: country ?? self.country,
            countryCode: countryCode ?? self.countryCode
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - PoiBackendType
struct PoiBackendType: Codable {
    let code, name: String?
}

// MARK: PoiBackendType convenience initializers and mutators

extension PoiBackendType {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(PoiBackendType.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        code: String?? = nil,
        name: String?? = nil
    ) -> PoiBackendType {
        return PoiBackendType(
            code: code ?? self.code,
            name: name ?? self.name
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - RiskInfos
struct RiskInfos: Codable {
    let vote, warn, riskSink: Bool?
    let type: Int?
    let content: String?

    enum CodingKeys: String, CodingKey {
        case vote, warn
        case riskSink = "risk_sink"
        case type, content
    }
}

// MARK: RiskInfos convenience initializers and mutators

extension RiskInfos {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(RiskInfos.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        vote: Bool?? = nil,
        warn: Bool?? = nil,
        riskSink: Bool?? = nil,
        type: Int?? = nil,
        content: String?? = nil
    ) -> RiskInfos {
        return RiskInfos(
            vote: vote ?? self.vote,
            warn: warn ?? self.warn,
            riskSink: riskSink ?? self.riskSink,
            type: type ?? self.type,
            content: content ?? self.content
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Statistics
struct Statistics: Codable {
    let awemeID: String?
    let commentCount, diggCount, downloadCount, playCount: Int?
    let shareCount, forwardCount: Int?

    enum CodingKeys: String, CodingKey {
        case awemeID = "aweme_id"
        case commentCount = "comment_count"
        case diggCount = "digg_count"
        case downloadCount = "download_count"
        case playCount = "play_count"
        case shareCount = "share_count"
        case forwardCount = "forward_count"
    }
}

// MARK: Statistics convenience initializers and mutators

extension Statistics {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Statistics.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        awemeID: String?? = nil,
        commentCount: Int?? = nil,
        diggCount: Int?? = nil,
        downloadCount: Int?? = nil,
        playCount: Int?? = nil,
        shareCount: Int?? = nil,
        forwardCount: Int?? = nil
    ) -> Statistics {
        return Statistics(
            awemeID: awemeID ?? self.awemeID,
            commentCount: commentCount ?? self.commentCount,
            diggCount: diggCount ?? self.diggCount,
            downloadCount: downloadCount ?? self.downloadCount,
            playCount: playCount ?? self.playCount,
            shareCount: shareCount ?? self.shareCount,
            forwardCount: forwardCount ?? self.forwardCount
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Status
struct Status: Codable {
    let awemeID: String?
    let isDelete, allowShare, allowComment, isPrivate: Bool?
    let withGoods: Bool?
    let privateStatus: Int?
    let withFusionGoods, inReviewing: Bool?
    let reviewed: Int?
    let selfSee, isProhibited: Bool?
    let downloadStatus: Int?

    enum CodingKeys: String, CodingKey {
        case awemeID = "aweme_id"
        case isDelete = "is_delete"
        case allowShare = "allow_share"
        case allowComment = "allow_comment"
        case isPrivate = "is_private"
        case withGoods = "with_goods"
        case privateStatus = "private_status"
        case withFusionGoods = "with_fusion_goods"
        case inReviewing = "in_reviewing"
        case reviewed
        case selfSee = "self_see"
        case isProhibited = "is_prohibited"
        case downloadStatus = "download_status"
    }
}

// MARK: Status convenience initializers and mutators

extension Status {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Status.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        awemeID: String?? = nil,
        isDelete: Bool?? = nil,
        allowShare: Bool?? = nil,
        allowComment: Bool?? = nil,
        isPrivate: Bool?? = nil,
        withGoods: Bool?? = nil,
        privateStatus: Int?? = nil,
        withFusionGoods: Bool?? = nil,
        inReviewing: Bool?? = nil,
        reviewed: Int?? = nil,
        selfSee: Bool?? = nil,
        isProhibited: Bool?? = nil,
        downloadStatus: Int?? = nil
    ) -> Status {
        return Status(
            awemeID: awemeID ?? self.awemeID,
            isDelete: isDelete ?? self.isDelete,
            allowShare: allowShare ?? self.allowShare,
            allowComment: allowComment ?? self.allowComment,
            isPrivate: isPrivate ?? self.isPrivate,
            withGoods: withGoods ?? self.withGoods,
            privateStatus: privateStatus ?? self.privateStatus,
            withFusionGoods: withFusionGoods ?? self.withFusionGoods,
            inReviewing: inReviewing ?? self.inReviewing,
            reviewed: reviewed ?? self.reviewed,
            selfSee: selfSee ?? self.selfSee,
            isProhibited: isProhibited ?? self.isProhibited,
            downloadStatus: downloadStatus ?? self.downloadStatus
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - TextExtra
struct TextExtra: Codable {
    let start, end: Int?
    let userID: String?
    let type: Int?
    let secUid: String?

    enum CodingKeys: String, CodingKey {
        case start, end
        case userID = "user_id"
        case type
        case secUid = "sec_uid"
    }
}

// MARK: TextExtra convenience initializers and mutators

extension TextExtra {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(TextExtra.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        start: Int?? = nil,
        end: Int?? = nil,
        userID: String?? = nil,
        type: Int?? = nil,
        secUid: String?? = nil
    ) -> TextExtra {
        return TextExtra(
            start: start ?? self.start,
            end: end ?? self.end,
            userID: userID ?? self.userID,
            type: type ?? self.type,
            secUid: secUid ?? self.secUid
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Video
struct Video: Codable {
    let playAddr, cover: LabelTop?
    let height, width: Int?
    let dynamicCover, originCover: LabelTop?
    let ratio: String?
    let downloadAddr: LabelTop?
    let hasWatermark: Bool?
    let playAddrLowbr: LabelTop?
    let bitRate: [BitRate]?
    let duration: Int?
    let downloadSuffixLogoAddr: LabelTop?
    let hasDownloadSuffixLogoAddr: Bool?
    let isH265, cdnURLExpired: Int?

    enum CodingKeys: String, CodingKey {
        case playAddr = "play_addr"
        case cover, height, width
        case dynamicCover = "dynamic_cover"
        case originCover = "origin_cover"
        case ratio
        case downloadAddr = "download_addr"
        case hasWatermark = "has_watermark"
        case playAddrLowbr = "play_addr_lowbr"
        case bitRate = "bit_rate"
        case duration
        case downloadSuffixLogoAddr = "download_suffix_logo_addr"
        case hasDownloadSuffixLogoAddr = "has_download_suffix_logo_addr"
        case isH265 = "is_h265"
        case cdnURLExpired = "cdn_url_expired"
    }
}

// MARK: Video convenience initializers and mutators

extension Video {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Video.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        playAddr: LabelTop?? = nil,
        cover: LabelTop?? = nil,
        height: Int?? = nil,
        width: Int?? = nil,
        dynamicCover: LabelTop?? = nil,
        originCover: LabelTop?? = nil,
        ratio: String?? = nil,
        downloadAddr: LabelTop?? = nil,
        hasWatermark: Bool?? = nil,
        playAddrLowbr: LabelTop?? = nil,
        bitRate: [BitRate]?? = nil,
        duration: Int?? = nil,
        downloadSuffixLogoAddr: LabelTop?? = nil,
        hasDownloadSuffixLogoAddr: Bool?? = nil,
        isH265: Int?? = nil,
        cdnURLExpired: Int?? = nil
    ) -> Video {
        return Video(
            playAddr: playAddr ?? self.playAddr,
            cover: cover ?? self.cover,
            height: height ?? self.height,
            width: width ?? self.width,
            dynamicCover: dynamicCover ?? self.dynamicCover,
            originCover: originCover ?? self.originCover,
            ratio: ratio ?? self.ratio,
            downloadAddr: downloadAddr ?? self.downloadAddr,
            hasWatermark: hasWatermark ?? self.hasWatermark,
            playAddrLowbr: playAddrLowbr ?? self.playAddrLowbr,
            bitRate: bitRate ?? self.bitRate,
            duration: duration ?? self.duration,
            downloadSuffixLogoAddr: downloadSuffixLogoAddr ?? self.downloadSuffixLogoAddr,
            hasDownloadSuffixLogoAddr: hasDownloadSuffixLogoAddr ?? self.hasDownloadSuffixLogoAddr,
            isH265: isH265 ?? self.isH265,
            cdnURLExpired: cdnURLExpired ?? self.cdnURLExpired
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - BitRate
struct BitRate: Codable {
    let gearName: String?
    let qualityType, bitRate: Int?
    let playAddr: LabelTop?
    let isH265: Int?

    enum CodingKeys: String, CodingKey {
        case gearName = "gear_name"
        case qualityType = "quality_type"
        case bitRate = "bit_rate"
        case playAddr = "play_addr"
        case isH265 = "is_h265"
    }
}

// MARK: BitRate convenience initializers and mutators

extension BitRate {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(BitRate.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        gearName: String?? = nil,
        qualityType: Int?? = nil,
        bitRate: Int?? = nil,
        playAddr: LabelTop?? = nil,
        isH265: Int?? = nil
    ) -> BitRate {
        return BitRate(
            gearName: gearName ?? self.gearName,
            qualityType: qualityType ?? self.qualityType,
            bitRate: bitRate ?? self.bitRate,
            playAddr: playAddr ?? self.playAddr,
            isH265: isH265 ?? self.isH265
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - VideoControl
struct VideoControl: Codable {
    let allowDownload: Bool?
    let shareType, showProgressBar, draftProgressBar: Int?
    let allowDuet, allowReact: Bool?
    let preventDownloadType: Int?
    let allowDynamicWallpaper: Bool?
    let timerStatus: Int?

    enum CodingKeys: String, CodingKey {
        case allowDownload = "allow_download"
        case shareType = "share_type"
        case showProgressBar = "show_progress_bar"
        case draftProgressBar = "draft_progress_bar"
        case allowDuet = "allow_duet"
        case allowReact = "allow_react"
        case preventDownloadType = "prevent_download_type"
        case allowDynamicWallpaper = "allow_dynamic_wallpaper"
        case timerStatus = "timer_status"
    }
}

// MARK: VideoControl convenience initializers and mutators

extension VideoControl {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(VideoControl.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        allowDownload: Bool?? = nil,
        shareType: Int?? = nil,
        showProgressBar: Int?? = nil,
        draftProgressBar: Int?? = nil,
        allowDuet: Bool?? = nil,
        allowReact: Bool?? = nil,
        preventDownloadType: Int?? = nil,
        allowDynamicWallpaper: Bool?? = nil,
        timerStatus: Int?? = nil
    ) -> VideoControl {
        return VideoControl(
            allowDownload: allowDownload ?? self.allowDownload,
            shareType: shareType ?? self.shareType,
            showProgressBar: showProgressBar ?? self.showProgressBar,
            draftProgressBar: draftProgressBar ?? self.draftProgressBar,
            allowDuet: allowDuet ?? self.allowDuet,
            allowReact: allowReact ?? self.allowReact,
            preventDownloadType: preventDownloadType ?? self.preventDownloadType,
            allowDynamicWallpaper: allowDynamicWallpaper ?? self.allowDynamicWallpaper,
            timerStatus: timerStatus ?? self.timerStatus
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - XiguaTask
struct XiguaTask: Codable {
    let isXiguaTask: Bool?

    enum CodingKeys: String, CodingKey {
        case isXiguaTask = "is_xigua_task"
    }
}

// MARK: XiguaTask convenience initializers and mutators

extension XiguaTask {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(XiguaTask.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        isXiguaTask: Bool?? = nil
    ) -> XiguaTask {
        return XiguaTask(
            isXiguaTask: isXiguaTask ?? self.isXiguaTask
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Extra
struct Extra: Codable {
    let now: Int?
    let fatalItemIDS: JSONNull?

    enum CodingKeys: String, CodingKey {
        case now
        case fatalItemIDS = "fatal_item_ids"
    }
}

// MARK: Extra convenience initializers and mutators

extension Extra {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Extra.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        now: Int?? = nil,
        fatalItemIDS: JSONNull?? = nil
    ) -> Extra {
        return Extra(
            now: now ?? self.now,
            fatalItemIDS: fatalItemIDS ?? self.fatalItemIDS
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - LogPb
struct LogPb: Codable {
    let imprID: String?

    enum CodingKeys: String, CodingKey {
        case imprID = "impr_id"
    }
}

// MARK: LogPb convenience initializers and mutators

extension LogPb {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(LogPb.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        imprID: String?? = nil
    ) -> LogPb {
        return LogPb(
            imprID: imprID ?? self.imprID
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
