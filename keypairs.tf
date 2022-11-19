resource "aws_key_pair" "netroxkey" {
    key_name = "netroxkey"
    public_key = file(var.pub_key)
}