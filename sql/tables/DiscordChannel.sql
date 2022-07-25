CREATE TABLE DiscordChannel(

    GuildId CHAR(18) NOT NULL,
    ChannelId CHAR(18) NOT NULL,
    ChannelName VARCHAR(32) NOT NULL,

    CONSTRAINT PK_DiscordChannel PRIMARY KEY(GuildId, ChannelId),
    CONSTRAINT FK_DiscordChannel_DiscordGuild FOREIGN KEY(GuildId) REFERENCES DiscordGuild(Id)

)