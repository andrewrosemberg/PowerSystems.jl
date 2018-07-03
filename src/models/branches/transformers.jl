"""
The 2-W transformer model uses an equivalent circuit assuming the impedance is on the High Voltage Side of the transformer.
The model allocates the iron losses and magnetezing suceptance to the primary side
"""

struct Transformer2W <: Branch
    name::String
    available::Bool
    connectionpoints::@NT(from::Bus, to::Bus)
    r::Float64 #[pu]
    x::Float64 #[pu]
    primaryshunt::Float64
    rate::Union{Float64,Nothing} #[MVA]
end

Transformer2W(; name = "init",
                status = false,
                connectionpoints = @NT(from::Bus(), to::Bus()),
                r = 0.0,
                x = 0.0,
                primaryshunt = 0.0,
                rate = nothing
            ) = Transformer2W(name, status, connectionpoints, r, x, zb, tap, α, rate)

struct TapTransformer <: Branch
    name::String
    available::Bool
    connectionpoints::@NT(from::Bus, to::Bus)
    r::Float64 #[pu]
    x::Float64 #[pu]
    primaryshunt::Float64
    tap::Float64 # [0 - 2]
    rate::Union{Float64,Nothing} #[MVA]
end

TapTransformer(; name = "init",
                status = false,
                connectionpoints = @NT(from::Bus(), to::Bus()),
                r = 0.0,
                x = 0.0,
                primaryshunt = 0.0,
                tap = 1.0,
                rate = nothing
            ) = Transformer2W(name, status, connectionpoints, r, x, zb, tap, α, rate)

struct Transformer3W <: Branch
    name::String
    available::Bool
    transformer::Transformer2W
    line::Line
end

Transformer3W(; name = "init",
                status = false,
                transformer = Transformer2W(),
                line = Line()
            ) = Transformer3W(name, status, transformer, line)

<<<<<<< HEAD
            struct PhaseShiftingTransformer <: Branch
                name::String
                available::Bool
                connectionpoints::@NT(from::Bus, to::Bus)
                r::Float64 #[pu]
                x::Float64 #[pu]
                primaryshunt::Float64
                tap::Float64 # [0 - 2]
                α::Float64 # [radians]
                rate::Union{Float64,Nothing} #[MVA]
            end
=======
struct PhaseShiftingTransformer <: Branch
    name::String
    available::Bool
    connectionpoints::@NT(from::Bus, to::Bus)
    r::Float64 #[pu]
    x::Float64 #[pu]
    primaryshunt::Float64
    tap::Float64 # [0 - 2]
    α::Float64 # [radians]
    rate::Union{Float64,Nothing} #[MVA]
end
>>>>>>> Updated phase shifting transformers

PhaseShiftingTransformer(; name = "init",
                status = false,
                connectionpoints = @NT(from::Bus(), to::Bus()),
                r = 0.0,
                x = 0.0,
<<<<<<< HEAD
=======
                primaryshunt::0.0,
>>>>>>> Updated phase shifting transformers
                tap = 1.0,
                α = 0.0,
                rate = nothing
            ) = Transformer2W(name, status, connectionpoints, r, x, primaryshunt, tap, α, rate)