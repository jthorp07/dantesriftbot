CREATE OR ALTER PROCEDURE AddDiscordChannel(
    @GuildId CHAR(18),
    @ChannelId CHAR(18),
    @ChannelName VARCHAR(32)
) AS BEGIN

    -- VALIDATE ARGS --
    IF @GuildId IS NULL OR @ChannelId IS NULL BEGIN
        PRINT 'Args cannot be null'
        RETURN 1
    END

    IF EXISTS (SELECT * FROM DiscordChannel WHERE ChannelId = @ChannelId AND GuildId = @GuildId) BEGIN
        PRINT 'Channel already registered'
        RETURN 2
    END

    -- ADD CHANNEL --
    INSERT INTO DiscordChannel(ChannelId, GuildId, ChannelName)
    VALUES(@ChannelId, @GuildId, @ChannelName)

    PRINT 'Channel added'
    RETURN 0

END