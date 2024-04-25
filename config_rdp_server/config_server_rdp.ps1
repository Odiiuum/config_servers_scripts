# Включаем микрофон
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\microphone" -Name "Value" -Value 1

# Получаем текущее состояние микрофона
Get-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\microphone"

# Включаем групповую политику для разрешения использования микрофона
$policyPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy"
$policyName = "LetAppsAccessMicrophone"

# Если групповая политика не существует, создаем ее
if (-not (Test-Path $policyPath)) {
    New-Item -Path $policyPath -Force
}

# Включаем разрешение использования микрофона
Set-ItemProperty -Path $policyPath -Name $policyName -Value 1

# Запустить службу аудио (Windows Audio)
Start-Service -Name "Audiosrv"

# Установка русской раскладки клавиатуры
Set-WinUserLanguageList -LanguageList en-US,ru-RU -Force
Set-WinDefaultInputMethodOverride -InputTip "0419:00000419"

# Установка языка системы
Set-WinSystemLocale -SystemLocale ru-RU

# Установка роли Remote Desktop Services
Install-WindowsFeature -Name RDS-RD-Server, RDS-Licensing -IncludeManagementTools

# Установите новый часовой пояс (Киев)
tzutil /s "FLE Standard Time"

# Перезагрузка сервера (если необходимо)
Restart-Computer -Force
