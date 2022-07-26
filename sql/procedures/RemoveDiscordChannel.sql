CREATE OR ALTER PROCEDURE RemoveDiscordChannel(
    @GuildId CHAR(18),
    @ChannelName VARCHAR(32)
) AS BEGIN

    -- VALIDATE ARGS --
    IF @GuildId IS NULL OR @ChannelName IS NULL BEGIN
        PRINT 'Args cannot be null'
        RETURN 1
    END

    IF NOT EXISTS (SELECT * FROM DiscordChannel WHERE ChannelName = @ChannelName AND GuildId = @GuildId) BEGIN
        PRINT 'Channel does not exist' 
        RETURN 3
    END

    DECLARE @ChannelId CHAR(18)

    SELECT @ChannelId=ChannelId
    FROM DiscordChannel
    WHERE GuildId = @GuildId AND ChannelName = @ChannelName

    IF EXISTS (SELECT * FROM DiscordMessage WHERE GuildId = @GuildId AND ChannelId = @ChannelId) BEGIN
        PRINT 'Channel cannot be deleted due to linked data'
        RETURN 4
    END

    -- REMOVE CHANNEL --
    DELETE FROM DiscordChannel
    WHERE GuildId = @GuildId
    AND ChannelName = @ChannelName

    PRINT 'Channel removed'
    RETURN 0

END