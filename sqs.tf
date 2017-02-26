#AWS SQS for hunterist Production
resource "aws_sqs_queue" "hunterist-prod-campaign-util" {
  name                      = "hunterist_prod_campaign_util"
  delay_seconds             = 0
  max_message_size          = 262144
  message_retention_seconds = 345600
  receive_wait_time_seconds = 0
}

resource "aws_sqs_queue" "hunterist-prod-low-priority-scene-request" {
  name                      = "hunterist_prod_low_priority_scene_request"
  delay_seconds             = 0
  max_message_size          = 262144
  message_retention_seconds = 345600
  receive_wait_time_seconds = 0
}

resource "aws_sqs_queue" "hunterist-prod-low-priority-scene-response" {
  name                      = "hunterist_prod_low_priority_scene_response"
  delay_seconds             = 0
  max_message_size          = 262144
  message_retention_seconds = 345600
  receive_wait_time_seconds = 0
}

resource "aws_sqs_queue" "hunterist-prod-video-scene" {
  name                      = "hunterist_prod_video_scene"
  delay_seconds             = 0
  max_message_size          = 262144
  message_retention_seconds = 345600
  receive_wait_time_seconds = 0
}

resource "aws_sqs_queue" "hunterist-prod-video-scene-result" {
  name                      = "hunterist_prod_video_scene_result"
  delay_seconds             = 0
  max_message_size          = 262144
  message_retention_seconds = 345600
  receive_wait_time_seconds = 0
}
