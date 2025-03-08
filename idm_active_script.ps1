# 参考使用说明请查看以下链接：
# https://github.com/codehubcloud/idm_active.git

# 设置错误处理为立即停止
$ErrorActionPreference = "Stop"

# 启用 TLS 1.2 以兼容较旧的客户端
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

# 定义脚本下载链接的主备地址
$DownloadURL1 = 'https://github.com/codehubcloud/idm_active/blob/master/idm_active.cmd'
$DownloadURL2 = 'https://github.com/codehubcloud/idm_active/blob/master/idm_active.cmd'

# 生成一个随机数，最大值为 99999999，用于命名临时文件
$rand = Get-Random -Maximum 99999999

# 检查当前用户是否具有管理员权限
$isAdmin = [bool]([Security.Principal.WindowsIdentity]::GetCurrent().Groups -match 'S-1-5-32-544')

# 根据用户权限设置临时文件路径
$FilePath = if ($isAdmin) {
    "$env:SystemRoot\Temp\IAS_$rand.cmd"
} else {
    "$env:TEMP\IAS_$rand.cmd"
}

# 尝试下载脚本，如果主链接下载失败，则切换到备份链接
try {
    $response = Invoke-WebRequest -Uri $DownloadURL1 -UseBasicParsing
}
catch {
    $response = Invoke-WebRequest -Uri $DownloadURL2 -UseBasicParsing
}

# 将传入的脚本参数转为字符串
$ScriptArgs = "$args "

# 在下载的脚本内容前添加随机数作为注释，避免文件冲突
$prefix = "@REM $rand `r`n"
$content = $prefix + $response

# 将组合后的脚本内容写入临时文件
Set-Content -Path $FilePath -Value $content

# 执行下载的脚本并等待其完成
Start-Process $FilePath $ScriptArgs -Wait

# 定义可能生成的临时文件路径列表
$FilePaths = @("$env:TEMP\IAS*.cmd", "$env:SystemRoot\Temp\IAS*.cmd")

# 删除所有临时脚本文件，清理环境
foreach ($FilePath in $FilePaths) {
    Get-Item $FilePath | Remove-Item
}
