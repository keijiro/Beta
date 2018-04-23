using UnityEngine;
using UnityEngine.Rendering;

namespace Beta
{
    public class Scanner : MonoBehaviour
    {
        #region Editable properties

        [SerializeField, ColorUsage(false)] Color _color = Color.red;

        public Color color {
            get { return _color; }
            set { _color = value; }
        }

        [SerializeField] float _lineWidth = 1;
        [SerializeField] Camera[] _targetCameras;

        #endregion

        #region Private fields

        [SerializeField, HideInInspector] Shader _shader;

        Material _material;
        CommandBuffer _command;

        #endregion

        #region MonoBehaviour functions

        void Start()
        {
            _material = new Material(_shader);
            _material.color = _color;

            _command = new CommandBuffer();
            _command.Blit(null, BuiltinRenderTextureType.CameraTarget, _material, 0);

            OnEnable();
        }

        void OnEnable()
        {
            if (_material == null) return;

            foreach (var camera in _targetCameras)
            {
                if (camera == null) continue;
                camera.AddCommandBuffer(CameraEvent.AfterEverything, _command);
            }
        }

        void OnDisable()
        {
            foreach (var camera in _targetCameras)
            {
                if (camera == null) continue;
                camera.RemoveCommandBuffer(CameraEvent.AfterEverything, _command);
            }
        }

        void OnDestroy()
        {
            Destroy(_material);
            _command.Dispose();
        }

        void Update()
        {
            _material.color = _color;
            _material.SetFloat("_Scale", 1 / _lineWidth);
        }

        #endregion
    }
}
