return {
  'saghen/blink.cmp',
  dependencies = 'rafamadriz/friendly-snippets',
  version = '*',
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = 'default' },

    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'mono',
      -- Mantén tus iconos visualmente consistentes
    },

    completion = {
      -- Mejora el rango de búsqueda para ser más flexible
      keyword = { range = 'full' },

      -- Configura la documentación para que se muestre automáticamente
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 300, -- Reducido para una respuesta más rápida
        treesitter_highlighting = true,
      },

      -- Mejora el menú con una configuración más avanzada
      menu = {
        draw = {
          columns = {
            { "kind_icon" },
            { "label",    "label_description", gap = 1 }
          },
          treesitter = { 'lsp' }, -- Habilita resaltado de sintaxis para elementos LSP
        },
        border = 'rounded',       -- Bordes redondeados para mejor estética
        winblend = 10,            -- Ligera transparencia
      },

      -- Configura el comportamiento de selección
      list = {
        selection = {
          preselect = true,
          auto_insert = true
        },
        max_items = 15, -- Limita a un número razonable de elementos
      },

      -- Habilita el texto fantasma para previsualizar las completaciones
      ghost_text = {
        enabled = true,
        show_with_selection = true,
      },

      -- Mejora la aceptación con opciones para paréntesis automáticos
      accept = {
        auto_brackets = {
          enabled = true,
          kind_resolution = {
            enabled = true,
          },
        },
        create_undo_point = true,
      },
    },

    -- Habilita la ayuda de firma (experimental pero útil)
    signature = {
      enabled = true,
      window = {
        border = 'rounded',
        min_width = 10,
        max_width = 80,
        max_height = 10,
      },
    },

    -- Configura las fuentes de completado
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
      -- Añade configuraciones específicas por tipo de archivo si necesitas
      per_filetype = {
        lua = { 'lsp', 'path', 'snippets', 'buffer' },
        -- Agrega más según necesites
      },
      -- Configura proveedores con opciones mejoradas
      providers = {
        lsp = {
          score_offset = 100, -- Prioriza LSP sobre otras fuentes
          transform_items = function(_, items)
            return vim.tbl_filter(
              function(item) return item.kind ~= require('blink.cmp.types').CompletionItemKind.Text end,
              items
            )
          end,
        },
        snippets = {
          score_offset = 90, -- Prioriza snippets justo después de LSP
          opts = {
            friendly_snippets = true,
          }
        },
        buffer = {
          score_offset = 60,
        },
        -- Añade el proveedor lazydev que definiste en tu otra configuración
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          score_offset = 100,
        },
      }
    },

    -- Configuración de fuzzy matching optimizada
    fuzzy = {
      implementation = "prefer_rust_with_warning",
      max_typos = function(keyword) return math.min(2, math.floor(#keyword / 5)) end,
      use_frecency = true,
      use_proximity = true,
    },

  },
  opts_extend = { "sources.default", "sources.providers" }
}
