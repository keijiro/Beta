using UnityEngine;
using Klak.Spout;

namespace Beta
{
    public class CodeOverlay : MonoBehaviour
    {
        #region Editable properties

        [SerializeField] SpoutReceiver _receiver;

        [SerializeField] Color _textColor = Color.green;

        public Color textColor {
            get { return _textColor; }
            set { _textColor = value; }
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

        void OnRenderImage(RenderTexture source, RenderTexture destination)
        {
            _material.SetColor("_Color", _textColor);
            _material.SetTexture("_CodeTex", _receiver.receivedTexture);
            Graphics.Blit(source, destination, _material, 0);
        }

        #endregion
    }
}
