CREATE TABLE GuildMember(

    GuildId CHAR(18) NOT NULL,
    UserId CHAR(18) NOT NULL,
    IsOwner BIT NOT NULL,

    CONSTRAINT PK_GuildMember PRIMARY KEY(GuildId, UserId),
    CONSTRAINT FK_GuildMember_DiscordGuild FOREIGN KEY(GuildId) REFERENCES DiscordGuild(Id),
    CONSTRAINT FK_GuildMember_DiscordUser FOREIGN KEY(UserId) REFERENCES DiscordUser(Id)


)