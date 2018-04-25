using UnityEngine;
using Klak.Spout;

namespace Beta
{
    public class KodeOverlay : MonoBehaviour
    {
        #region Editable properties

        [SerializeField] SpoutReceiver _receiver;
        [SerializeField, ColorUsage(false)] Color _textColor = Color.green;
        [SerializeField, Range(0, 1)] float _renderOpacity = 1;
        [SerializeField, Range(0, 0.99f)] float _renderThreshold = 0;

        public Color textColor {
            get { return _textColor; }
            set { _textColor = value; }
        }

        public float renderOpacity {
            get { return _renderOpacity; }
            set { _renderOpacity = value; }
        }

        public float renderThreshold {
            get { return _renderThreshold; }
            set { _renderThreshold = value; }
        }

        #endregion

        #region Private fields

        [SerializeField, HideInInspector] Shader _shader;

        Material _material;

        #endregion

        #region MonoBehaviour functions

        void Start()
        {
            _material = new Material(_shader);
        }

        void OnDestroy()
        {
            Destroy(_material);
        }

        void OnPostRender()
        {
            _material.SetColor("_TextColor", _textColor);
            _material.SetFloat("_RenderOpacity", _renderOpacity);
            _material.SetFloat("_RenderThreshold", _renderThreshold);
            Graphics.Blit(_receiver.receivedTexture, _material, 0);
        }

        #endregion
    }
}
