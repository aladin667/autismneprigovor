local CONFIG = {
    FPS_CAP = 999999999,           
    BRIGHTNESS = 0,               
    BLAST_PRESSURE = 1,            
    BLAST_RADIUS = 1,              
    DEFAULT_TEXTURE_ID = "10385902758728957", 
    LIGHTING_TECH = 2             
}

local function optimizeObject(obj)
    local success, err = pcall(function()
        if obj:IsA("Model") then
            obj.LevelOfDetail = "Disabled"
            obj.ModelStreamingMode = "Nonatomic"
        elseif obj:IsA("BasePart") and not obj:IsA("MeshPart") then
            obj.Reflectance = 0
            obj.MaterialVariant = ""
        elseif obj:IsA("Decal") or obj:IsA("Texture") then
            obj.Transparency = 1
        elseif obj:IsA("MeshPart") and not obj:IsA("SolidModel") then
            obj.DoubleSided = false
            obj.TextureID = CONFIG.DEFAULT_TEXTURE_ID
        elseif obj:IsA("SpecialMesh") then
            obj.TextureId = 0
        elseif obj:IsA("ShirtGraphic") then
            obj.Graphic = 0
        elseif obj:IsA("Shirt") or obj:IsA("Pants") then
            obj[obj.ClassName .. "Template"] = 0
        elseif obj:IsA("Fire") or obj:IsA("SpotLight") or obj:IsA("Smoke") or obj:IsA("Sparkles") then
            obj.Enabled = false
        elseif obj:IsA("Explosion") then
            obj.BlastPressure = CONFIG.BLAST_PRESSURE
            obj.BlastRadius = CONFIG.BLAST_RADIUS
        elseif obj:IsA("ParticleEmitter") or obj:IsA("Trail") then
            obj.Enabled = false
        elseif obj:IsA("Beam") then
            obj.Enabled = false
        elseif obj:IsA("SurfaceAppearance") or obj:IsA("Debris") or obj:IsA("MaterialVariant") then
            obj:Destroy()
        elseif obj:IsA("Attachment") then
            obj.Visible = false
        end
    end)
    if not success then
        warn("" .. obj.Name .. "" .. err)
    end
end

local function processDescendants(service, callback)
    local descendants = service:GetDescendants()
    for i = 1, #descendants do
        callback(descendants[i])
    end
end

local function optimizePhysics()
    local workspace = game:GetService("Workspace")
    local physicsSettings = settings().Physics
    physicsSettings.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Disabled
    physicsSettings.AllowSleep = true
    
    local terrain = workspace:FindFirstChildOfClass("Terrain")
    if terrain then
        sethiddenproperty(terrain, "Decoration", false)
    end
end

local function initializeOptimization()
    setfpscap(CONFIG.FPS_CAP)
    
    processDescendants(game:GetService("Workspace"), optimizeObject)
    
    local lighting = game:GetService("Lighting")
    processDescendants(lighting, function(v)
        if v:IsA("Sky") or v:IsA("Atmosphere") or v:IsA("BloomEffect") or 
           v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("DepthOfFieldEffect") or 
           v:IsA("Clouds") or v:IsA("PostEffect") or v:IsA("ColorCorrectionEffect") then
            v:Destroy()
        end
    end)
    
    sethiddenproperty(lighting, "Technology", CONFIG.LIGHTING_TECH)
    lighting.GlobalShadows = false
    lighting.Brightness = CONFIG.BRIGHTNESS

    optimizePhysics()
end

local function setupEventListeners()
    local lighting = game:GetService("Lighting")
    local workspace = game:GetService("Workspace")
    
    lighting.ChildAdded:Connect(function(v)
        task.spawn(function()
            local success, err = pcall(function()
                if v then v:Destroy() end
            end)
            if not success then
                warn("" .. err)
            end
        end)
    end)
    
    workspace.DescendantAdded:Connect(function(added)
        task.spawn(function()
            optimizeObject(added)
        end)
    end)
end

do
    local success, err = pcall(function()
        initializeOptimization()
        setupEventListeners()
    end)
    if not success then
        warn("" .. err)
    end
end
