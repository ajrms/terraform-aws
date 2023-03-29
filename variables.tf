# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-northeast-2"
}

variable "my-ip-address" {
  description = "ip-address"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}