FROM cabotapp/cabot:latest

LABEL maintainer="Jamie Curnow <jc@jc21.com>"

RUN pip install cabot-alert-pushover \
	&& pip install cabot-alert-webhooks \
	&& pip install cabot-alert-twilio \
	&& pip install cabot-alert-slack \
	&& pip install cabot-check-sslcert

ENV CABOT_PLUGINS_ENABLED=cabot_alert_hipchat,cabot_alert_twilio,cabot_alert_email,cabot_alert_slack,cabot_alert_pushover,cabot_alert_webhooks,cabot_check_sslcert
