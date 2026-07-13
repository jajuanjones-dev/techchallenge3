resource "aws_key_pair" "web_key" {
  key_name   = "techchallenge3-key"
  public_key = file("${path.module}/../webserver-key.pub")
}
