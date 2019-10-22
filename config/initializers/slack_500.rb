require 'slack_500'

Slack500.setup do |config|

    # report pretext of slack message
    config.pretext = 'Slack Report Title'

    # report title of slack message
    config.title = 'Rendering 500 with exception.'

    # color of slack message
    config.color = '#FF0000'

    # footer text of slack message
    config.footer = 'via Slack 500 Report.'

    # WebHook URL
    # see https://slack.com/services/new/incoming-webhook
    config.webhook_url = 'https://hooks.slack.com/services/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'

end
