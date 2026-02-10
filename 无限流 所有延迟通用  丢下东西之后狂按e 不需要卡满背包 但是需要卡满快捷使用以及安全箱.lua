--160延迟环境下测试稳定，背包塞满，安全口袋塞满

-- 完整序列：强制使用超大坐标
local RIGHT_CLICK_X = 51806-- 右键点击位置
local RIGHT_CLICK_Y = 20833-- 右键点击位置

local LEFT_CLICK_X = 54402-- 左键点击位置
local LEFT_CLICK_Y = 32130-- 左键点击位置

function OnEvent(event, arg)
    -- G5: 重新执行高延迟连发宏（保留原逻辑，但删除了执行循环宏的核心）
    if event == "MOUSE_BUTTON_PRESSED" and arg == 5 then
        OutputLogMessage("重新执行高延迟连发宏\n")
        
        -- 停止所有可能运行的宏
        if PlayMacroStop then
            PlayMacroStop()
        end
        
        -- 释放所有可能按下的键
        ReleaseMouseButton(1)
        ReleaseMouseButton(3)
        ReleaseKey("p")
        ReleaseKey("h")
        ReleaseKey("e")
        ReleaseKey("tab")
        
        -- 显示坐标信息
        local x, y = GetMousePosition()
        OutputLogMessage("当前坐标: X=%d, Y=%d\n", x, y)
        OutputLogMessage("右键目标: (%d, %d)\n", RIGHT_CLICK_X, RIGHT_CLICK_Y)
        OutputLogMessage("左键目标: (%d, %d)\n\n", LEFT_CLICK_X, LEFT_CLICK_Y)
        
        -- 添加短暂延迟确保所有按键都已释放
        Sleep(50)
        
        -- 【删除执行循环宏的代码】
        OutputLogMessage("已重置按键状态，未执行循环宏\n")
    end
    
    -- G4: 开始执行（删除执行循环宏的逻辑）
    if event == "MOUSE_BUTTON_PRESSED" and arg == 4 then
        OutputLogMessage("开始执行完整序列\n")
        
        -- 0. 左键按下并保持（长按）
        PressMouseButton(1)  -- 左键按下
        Sleep(200)
        PressKey("tab")
        Sleep(20)
        ReleaseKey("tab")
        Sleep(20)
        ReleaseMouseButton(1)  -- 左键释放
        Sleep(20)
        
        -- 4. 移动到右键位置并右键点击
        MoveMouseTo(RIGHT_CLICK_X, RIGHT_CLICK_Y)
        Sleep(20)
        PressMouseButton(3)
        Sleep(20)
        ReleaseMouseButton(3)
        Sleep(20)
        
        -- 5. 移动到左键位置并左键点击
        MoveMouseTo(LEFT_CLICK_X, LEFT_CLICK_Y)
        Sleep(10)
        PressMouseButton(1)
        Sleep(10)
        ReleaseMouseButton(1)
        Sleep(100)
        PressKey("p")
        Sleep(10)
        ReleaseKey("p")
          
        -- 7. 按下Tab键（第二次）
        Sleep(20)
        PressKey("tab")
        Sleep(20)
        ReleaseKey("tab")
        Sleep(800)
        
       -- 8. 按下p键（第二次）
        PressKey("p")
        Sleep(10)
        ReleaseKey("p")
        Sleep(10)
        
        -- 9. 替换为长按左键1秒钟
        PressMouseButton(1)
        Sleep(1000)
        ReleaseMouseButton(1)
        Sleep(100)
        
        -- 【删除执行循环宏的日志和代码】
        OutputLogMessage("前置操作完成，未执行循环宏\n")
    end
end